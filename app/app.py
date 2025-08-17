from flask import Flask, render_template, request, redirect, url_for, flash
from db_connection import call_proc, exec_function, fetch_view, exec_sql


def _clean(texto: str) -> str:
    return " ".join((texto or "").split())


def get_roles():
    try:
        cols = exec_sql(
            """
            SELECT column_name
            FROM information_schema.columns
            WHERE table_schema = current_schema()
              AND table_name = %s
            """,
            ("rol",),
            fetch=True,
        )
        colnames = {r["column_name"] for r in (cols or [])}
        candidates = ["nombre", "rol", "descripcion", "nombre_rol", "tipo", "titulo", "name"]
        label_col = next((c for c in candidates if c in colnames), None)

        if label_col:
            rows = exec_sql(
                f"SELECT id_rol, {label_col} AS nombre FROM public.rol ORDER BY {label_col}",
                fetch=True,
            )
        else:
            rows = exec_sql("SELECT id_rol FROM public.rol ORDER BY id_rol", fetch=True)
            for r in rows or []:
                r["nombre"] = f"Rol {r['id_rol']}"

        return rows or []
    except Exception:
        return []


app = Flask(__name__)
app.config["SECRET_KEY"] = "jde3sn3HSWBI"


@app.route("/")
def index():
    return render_template("index.html")


# ==========================================================================
#                                  PRODUCTOS
#   Listado: Hacemos un SELECT directo a public.producto
#   Fallbacks: Por si falla CALL → DML directo.
#   Es necesario que exista una categoría para registar un producto
# ==========================================================================

@app.route("/productos")
def productos_listar():
    try:
        rows = fetch_view("producto ORDER BY id_producto")
        productos = [dict(r) for r in rows] if rows else []
        return render_template("productos/list.html", productos=productos)
    except Exception as e:
        flash(f"Error listando productos: {e}", "danger")
        return render_template("productos/list.html", productos=[])

@app.route("/productos/crear", methods=["GET", "POST"])
def productos_crear():
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            descripcion = _clean(request.form.get("descripcion") or "")
            precio = request.form["precio"]
            stock = request.form["stock"]
            estado = request.form.get("estado", "A")
            id_categoria = request.form["id_categoria"]
            try:
                call_proc(
                    "paquete_producto.sp_insertar_producto",
                    (nombre, descripcion, precio, stock, estado, id_categoria),
                )
            except Exception:
                exec_sql(
                    """
                    INSERT INTO public.producto
                      (nombre, descripcion, precio, stock, estado, id_categoria)
                    VALUES (%s,%s,%s,%s,%s,%s)
                    """,
                    (nombre, descripcion, precio, stock, estado, id_categoria),
                )
            flash("Producto creado correctamente", "success")
            return redirect(url_for("productos_listar"))
        except Exception as e:
            flash(f"Error creando producto: {e}", "danger")
            return redirect(url_for("productos_crear"))

    categorias = fetch_view("categoria ORDER BY nombre")
    return render_template("productos/form.html", modo="crear", categorias=categorias)


@app.route("/productos/editar/<int:id_producto>", methods=["GET", "POST"])
def productos_editar(id_producto):
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            descripcion = _clean(request.form.get("descripcion") or "")
            precio = request.form["precio"]
            stock = request.form["stock"]
            estado = request.form.get("estado", "A")
            id_categoria = request.form["id_categoria"]

            try:
                call_proc(
                    "paquete_producto.sp_actualizar_producto",
                    (id_producto, nombre, descripcion, precio, stock, estado, id_categoria),
                )
            except Exception:
                exec_sql(
                    """
                    UPDATE public.producto
                       SET nombre=%s, descripcion=%s, precio=%s, stock=%s, estado=%s, id_categoria=%s
                     WHERE id_producto=%s
                    """,
                    (nombre, descripcion, precio, stock, estado, id_categoria, id_producto),
                )
            flash("Producto actualizado", "success")
            return redirect(url_for("productos_listar"))
        except Exception as e:
            flash(f"Error actualizando: {e}", "danger")
            return redirect(url_for("productos_editar", id_producto=id_producto))

    producto_row = fetch_view("producto", "WHERE id_producto = %s", (id_producto,))
    producto = producto_row[0] if producto_row else None
    categorias = fetch_view("categoria ORDER BY nombre")
    return render_template("productos/form.html", modo="editar", producto=producto, categorias=categorias)


@app.route("/productos/eliminar/<int:id_producto>", methods=["POST"])
def productos_eliminar(id_producto):
    try:
        try:
            call_proc("paquete_producto.sp_eliminar_producto", (id_producto,))
        except Exception:
            exec_sql("DELETE FROM public.producto WHERE id_producto=%s", (id_producto,))
        flash("Producto eliminado", "info")
    except Exception as e:
        flash(f"Error eliminando: {e}", "danger")
    return redirect(url_for("productos_listar"))


# ==========================================================================
#                                 CATEGORÍAS
# ==========================================================================

@app.route("/categorias")
def categorias_listar():
    try:
        categorias = fetch_view("categoria ORDER BY nombre")
        return render_template("categorias/list.html", categorias=categorias)
    except Exception as e:
        flash(f"Error listando categorías: {e}", "danger")
        return render_template("categorias/list.html", categorias=[])


@app.route("/categorias/crear", methods=["GET", "POST"])
def categorias_crear():
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            descripcion = _clean(request.form.get("descripcion") or "")
            try:
                call_proc("paquete_categoria.sp_insertar_categoria", (nombre, descripcion))
            except Exception:
                exec_sql(
                    "INSERT INTO public.categoria (nombre, descripcion) VALUES (%s,%s)",
                    (nombre, descripcion),
                )
            flash("Categoría creada", "success")
            return redirect(url_for("categorias_listar"))
        except Exception as e:
            flash(f"Error creando categoría: {e}", "danger")
            return redirect(url_for("categorias_crear"))
    return render_template("categorias/form.html", modo="crear")


@app.route("/categorias/editar/<int:id_categoria>", methods=["GET", "POST"])
def categorias_editar(id_categoria):
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            descripcion = _clean(request.form.get("descripcion") or "")
            try:
                call_proc(
                    "paquete_categoria.sp_actualizar_categoria", (id_categoria, nombre, descripcion)
                )
            except Exception:
                exec_sql(
                    "UPDATE public.categoria SET nombre=%s, descripcion=%s WHERE id_categoria=%s",
                    (nombre, descripcion, id_categoria),
                )
            flash("Categoría actualizada", "success")
            return redirect(url_for("categorias_listar"))
        except Exception as e:
            flash(f"Error actualizando categoría: {e}", "danger")
            return redirect(url_for("categorias_editar", id_categoria=id_categoria))

    cats = fetch_view("categoria", "WHERE id_categoria = %s", (id_categoria,))
    categoria = cats[0] if cats else None
    return render_template("categorias/form.html", modo="editar", categoria=categoria)


@app.route("/categorias/eliminar/<int:id_categoria>", methods=["POST"])
def categorias_eliminar(id_categoria):
    try:
        try:
            call_proc("paquete_categoria.sp_eliminar_categoria", (id_categoria,))
        except Exception:
            exec_sql("DELETE FROM public.categoria WHERE id_categoria=%s", (id_categoria,))
        flash("Categoría eliminada", "info")
    except Exception as e:
        flash(f"Error eliminando categoría: {e}", "danger")
    return redirect(url_for("categorias_listar"))


# ==========================================================================
#                                  CLIENTES
# ==========================================================================

@app.route("/clientes")
def clientes_listar():
    try:
        clientes = fetch_view("cliente ORDER BY nombre")
        return render_template("clientes/list.html", clientes=clientes)
    except Exception as e:
        flash(f"Error listando clientes: {e}", "danger")
        return render_template("clientes/list.html", clientes=[])


@app.route("/clientes/crear", methods=["GET", "POST"])
def clientes_crear():
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            telefono = _clean(request.form.get("telefono") or "")
            correo = _clean(request.form.get("correo") or "")
            try:
                call_proc("paquete_cliente.sp_insertar_cliente", (nombre, telefono, correo))
            except Exception:
                exec_sql(
                    "INSERT INTO public.cliente (nombre, telefono, correo) VALUES (%s,%s,%s)",
                    (nombre, telefono, correo),
                )
            flash("Cliente creado", "success")
            return redirect(url_for("clientes_listar"))
        except Exception as e:
            flash(f"Error creando cliente: {e}", "danger")
            return redirect(url_for("clientes_crear"))
    return render_template("clientes/form.html", modo="crear")


@app.route("/clientes/editar/<int:id_cliente>", methods=["GET", "POST"])
def clientes_editar(id_cliente):
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            telefono = _clean(request.form.get("telefono") or "")
            correo = _clean(request.form.get("correo") or "")
            try:
                call_proc(
                    "paquete_cliente.sp_actualizar_cliente", (id_cliente, nombre, telefono, correo)
                )
            except Exception:
                exec_sql(
                    "UPDATE public.cliente SET nombre=%s, telefono=%s, correo=%s WHERE id_cliente=%s",
                    (nombre, telefono, correo, id_cliente),
                )
            flash("Cliente actualizado", "success")
            return redirect(url_for("clientes_listar"))
        except Exception as e:
            flash(f"Error actualizando cliente: {e}", "danger")
            return redirect(url_for("clientes_editar", id_cliente=id_cliente))

    row = fetch_view("cliente", "WHERE id_cliente = %s", (id_cliente,))
    cliente = row[0] if row else None
    return render_template("clientes/form.html", modo="editar", cliente=cliente)


@app.route("/clientes/eliminar/<int:id_cliente>", methods=["POST"])
def clientes_eliminar(id_cliente):
    try:
        try:
            call_proc("paquete_cliente.sp_eliminar_cliente", (id_cliente,))
        except Exception:
            exec_sql("DELETE FROM public.cliente WHERE id_cliente=%s", (id_cliente,))
        flash("Cliente eliminado", "info")
    except Exception as e:
        flash(f"Error eliminando cliente: {e}", "danger")
    return redirect(url_for("clientes_listar"))


# ==========================================================================
#                                   USUARIOS
#   Nota umportante: requiere de roles existentes.
# ==========================================================================

@app.route("/usuarios")
def usuarios_listar():
    try:
        usuarios = fetch_view("usuario ORDER BY nombre")
        return render_template("usuarios/list.html", usuarios=usuarios)
    except Exception as e:
        flash(f"Error listando usuarios: {e}", "danger")
        return render_template("usuarios/list.html", usuarios=[])


@app.route("/usuarios/crear", methods=["GET", "POST"])
def usuarios_crear():
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            usuario = _clean(request.form["usuario"])
            clave = _clean(request.form["clave"])
            id_rol = request.form["id_rol"]

            try:
                call_proc(
                    "paquete_usuario.sp_insertar_usuario", (nombre, usuario, clave, id_rol)
                )
            except Exception:
                exec_sql(
                    "INSERT INTO public.usuario (nombre, usuario, clave, id_rol) VALUES (%s,%s,%s,%s)",
                    (nombre, usuario, clave, id_rol),
                )
            flash("Usuario creado", "success")
            return redirect(url_for("usuarios_listar"))
        except Exception as e:
            flash(f"Error creando usuario: {e}", "danger")
            return redirect(url_for("usuarios_crear"))

    roles = get_roles()
    if not roles:
        flash("No hay roles definidos. Crea roles en la base de datos antes de crear usuarios.", "warning")
    return render_template("usuarios/form.html", modo="crear", roles=roles)


@app.route("/usuarios/editar/<int:id_usuario>", methods=["GET", "POST"])
def usuarios_editar(id_usuario):
    if request.method == "POST":
        try:
            nombre = _clean(request.form["nombre"])
            usuario = _clean(request.form["usuario"])
            clave = _clean(request.form["clave"])
            id_rol = request.form["id_rol"]

            try:
                call_proc(
                    "paquete_usuario.sp_actualizar_usuario",
                    (id_usuario, nombre, usuario, clave, id_rol),
                )
            except Exception:
                exec_sql(
                    """
                    UPDATE public.usuario
                       SET nombre=%s, usuario=%s, clave=%s, id_rol=%s
                     WHERE id_usuario=%s
                    """,
                    (nombre, usuario, clave, id_rol, id_usuario),
                )
            flash("Usuario actualizado", "success")
            return redirect(url_for("usuarios_listar"))
        except Exception as e:
            flash(f"Error actualizando usuario: {e}", "danger")
            return redirect(url_for("usuarios_editar", id_usuario=id_usuario))

    usuario_row = fetch_view("usuario", "WHERE id_usuario = %s", (id_usuario,))
    roles = get_roles()
    return render_template(
        "usuarios/form.html",
        modo="editar",
        usuario=usuario_row[0] if usuario_row else None,
        roles=roles,
    )


@app.route("/usuarios/eliminar/<int:id_usuario>", methods=["POST"])
def usuarios_eliminar(id_usuario):
    try:
        try:
            call_proc("paquete_usuario.sp_eliminar_usuario", (id_usuario,))
        except Exception:
            exec_sql("DELETE FROM public.usuario WHERE id_usuario=%s", (id_usuario,))
        flash("Usuario eliminado", "info")
    except Exception as e:
        flash(f"Error eliminando usuario: {e}", "danger")
    return redirect(url_for("usuarios_listar"))


# ==========================================================================
#                                   REPORTES
# ==========================================================================

@app.route("/reportes")
def reportes_index():
    return render_template("reportes/index.html")


@app.route("/reportes/stock-bajo")
def reporte_stock_bajo():
    try:
        rows = fetch_view("vista_productos_stock_bajo")
        return render_template("reportes/stock_bajo.html", rows=rows)
    except Exception as e:
        flash(f"Error cargando reporte: {e}", "danger")
        return render_template("reportes/stock_bajo.html", rows=[])


@app.route("/reportes/ventas-detalladas")
def reporte_ventas_detalladas():
    try:
        rows = fetch_view("vista_ventas_detalladas")
        return render_template("reportes/ventas_detalladas.html", rows=rows)
    except Exception as e:
        flash(f"Error cargando reporte: {e}", "danger")
        return render_template("reportes/ventas_detalladas.html", rows=[])


@app.route("/reportes/productos-mas-vendidos")
def reporte_productos_mas_vendidos():
    try:
        rows = fetch_view("vista_productos_mas_vendidos")
        return render_template("reportes/productos_mas_vendidos.html", rows=rows)
    except Exception as e:
        flash(f"Error cargando reporte: {e}", "danger")
        return render_template("reportes/productos_mas_vendidos.html", rows=[])


@app.route("/reportes/ventas-por-dia")
def reporte_ventas_por_dia():
    try:
        rows = fetch_view("vista_ventas_por_dia")
        return render_template("reportes/ventas_por_dia.html", rows=rows)
    except Exception as e:
        flash(f"Error cargando reporte: {e}", "danger")
        return render_template("reportes/ventas_por_dia.html", rows=[])


@app.route("/reportes/ventas-por-usuario")
def reporte_ventas_por_usuario():
    try:
        rows = fetch_view("vista_ventas_por_usuario")
        return render_template("reportes/ventas_por_usuario.html", rows=rows)
    except Exception as e:
        flash(f"Error cargando reporte: {e}", "danger")
        return render_template("reportes/ventas_por_usuario.html", rows=rows)

if __name__ == "__main__":
    app.run(debug=True)

