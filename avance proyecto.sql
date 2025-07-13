-- paquete_categoria
CREATE SCHEMA IF NOT EXISTS paquete_categoria;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_insertar_categoria(nombre varchar, descripcion text)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Categoria"(nombre, descripcion) VALUES (nombre, descripcion);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_actualizar_categoria(id_categoria int, nombre varchar, descripcion text)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Categoria" SET nombre = nombre, descripcion = descripcion WHERE id_categoria = id_categoria;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_eliminar_categoria(id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Categoria" WHERE id_categoria = id_categoria;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_categoria.fn_get_nombre_categoria(p_id int)
RETURNS varchar AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre INTO v_nombre FROM "Categoria" WHERE id_categoria = p_id;
  RETURN v_nombre;
END;
$$ LANGUAGE plpgsql;


-- paquete_producto
CREATE SCHEMA IF NOT EXISTS paquete_producto;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_insertar_producto(nombre varchar, descripcion text, precio decimal, stock int, estado char, id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Producto"(nombre, descripcion, precio, stock, estado, id_categoria)
  VALUES (nombre, descripcion, precio, stock, estado, id_categoria);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_actualizar_producto(id_producto int, nombre varchar, descripcion text, precio decimal, stock int, estado char, id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Producto" SET nombre = nombre, descripcion = descripcion, precio = precio, stock = stock, estado = estado, id_categoria = id_categoria
  WHERE id_producto = id_producto;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_eliminar_producto(id_producto int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Producto" WHERE id_producto = id_producto;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_producto.fn_get_stock_producto(p_id int)
RETURNS int AS $$
DECLARE
  v_stock int;
BEGIN
  SELECT stock INTO v_stock FROM "Producto" WHERE id_producto = p_id;
  RETURN v_stock;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_producto.fn_get_precio_producto(p_id int)
RETURNS decimal AS $$
DECLARE
  v_precio decimal;
BEGIN
  SELECT precio INTO v_precio FROM "Producto" WHERE id_producto = p_id;
  RETURN v_precio;
END;
$$ LANGUAGE plpgsql;


-- paquete_cliente
CREATE SCHEMA IF NOT EXISTS paquete_cliente;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_insertar_cliente(nombre varchar, telefono varchar, correo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Cliente"(nombre, telefono, correo) VALUES (nombre, telefono, correo);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_actualizar_cliente(id_cliente int, nombre varchar, telefono varchar, correo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Cliente" SET nombre = nombre, telefono = telefono, correo = correo WHERE id_cliente = id_cliente;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_eliminar_cliente(id_cliente int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Cliente" WHERE id_cliente = id_cliente;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_cliente.fn_contar_clientes()
RETURNS int AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Cliente";
  RETURN v_count;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_cliente.fn_get_telefono_cliente(p_id int)
RETURNS varchar AS $$
DECLARE
  v_tel varchar;
BEGIN
  SELECT telefono INTO v_tel FROM "Cliente" WHERE id_cliente = p_id;
  RETURN v_tel;
END;
$$ LANGUAGE plpgsql;


-- paquete_usuario
CREATE SCHEMA IF NOT EXISTS paquete_usuario;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_insertar_usuario(nombre varchar, usuario varchar, clave varchar, id_rol int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Usuario"(nombre, usuario, clave, id_rol) VALUES (nombre, usuario, clave, id_rol);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_actualizar_usuario(id_usuario int, nombre varchar, usuario varchar, clave varchar, id_rol int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Usuario" SET nombre = nombre, usuario = usuario, clave = clave, id_rol = id_rol WHERE id_usuario = id_usuario;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_eliminar_usuario(id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Usuario" WHERE id_usuario = id_usuario;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_usuario.fn_usuario_existe(p_usuario varchar)
RETURNS boolean AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Usuario" WHERE usuario = p_usuario;
  IF v_count > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_usuario.fn_get_nombre_rol(p_id int)
RETURNS varchar AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre_rol INTO v_nombre FROM "Rol" WHERE id_rol = p_id;
  RETURN v_nombre;
END;
$$ LANGUAGE plpgsql;


-- paquete_venta
CREATE SCHEMA IF NOT EXISTS paquete_venta;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_insertar_venta(fecha timestamp, total decimal, estado varchar, id_cliente int, id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Venta"(fecha, total, estado, id_cliente, id_usuario) VALUES (fecha, total, estado, id_cliente, id_usuario);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_actualizar_venta(id_venta int, fecha timestamp, total decimal, estado varchar, id_cliente int, id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Venta" SET fecha = fecha, total = total, estado = estado, id_cliente = id_cliente, id_usuario = id_usuario WHERE id_venta = id_venta;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_eliminar_venta(id_venta int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Venta" WHERE id_venta = id_venta;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_venta.fn_total_ventas_cliente(p_id_cliente int)
RETURNS decimal AS $$
DECLARE
  v_total decimal;
BEGIN
  SELECT COALESCE(SUM(total),0) INTO v_total FROM "Venta" WHERE id_cliente = p_id_cliente;
  RETURN v_total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_venta.fn_cantidad_ventas_usuario(p_id_usuario int)
RETURNS int AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Venta" WHERE id_usuario = p_id_usuario;
  RETURN v_count;
END;
$$ LANGUAGE plpgsql;


-- paquete_detalleventa
CREATE SCHEMA IF NOT EXISTS paquete_detalleventa;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_insertar_detalleventa(id_venta int, id_producto int, cantidad int, precio_unitario decimal)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "DetalleVenta"(id_venta, id_producto, cantidad, precio_unitario)
  VALUES (id_venta, id_producto, cantidad, precio_unitario);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_actualizar_detalleventa(id_detalle int, id_venta int, id_producto int, cantidad int, precio_unitario decimal)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "DetalleVenta"
  SET id_venta = id_venta, id_producto = id_producto, cantidad = cantidad, precio_unitario = precio_unitario
  WHERE id_detalle = id_detalle;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_eliminar_detalleventa(id_detalle int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "DetalleVenta" WHERE id_detalle = id_detalle;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_detalleventa.fn_cantidad_vendida_producto(p_id_producto int)
RETURNS int AS $$
DECLARE
  v_cantidad int;
BEGIN
  SELECT COALESCE(SUM(cantidad),0) INTO v_cantidad FROM "DetalleVenta" WHERE id_producto = p_id_producto;
  RETURN v_cantidad;
END;
$$ LANGUAGE plpgsql;


-- paquete_inventario
CREATE SCHEMA IF NOT EXISTS paquete_inventario;

CREATE OR REPLACE FUNCTION paquete_inventario.fn_total_productos_inventario()
RETURNS int AS $$
DECLARE
  v_total int;
BEGIN
  SELECT COUNT(*) INTO v_total FROM "Inventario";
  RETURN v_total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_inventario.fn_stock_minimo(p_id_producto int)
RETURNS boolean AS $$
DECLARE
  v_stock int;
  v_stock_minimo int;
BEGIN
  SELECT stock INTO v_stock FROM "Producto" WHERE id_producto = p_id_producto;
  SELECT stock_minimo INTO v_stock_minimo FROM "Inventario" WHERE id_producto = p_id_producto;
  IF v_stock <= v_stock_minimo THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;


-- paquete_pago
CREATE SCHEMA IF NOT EXISTS paquete_pago;

CREATE OR REPLACE PROCEDURE paquete_pago.sp_insertar_pago(id_venta int, monto decimal, metodo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Pago"(id_venta, monto, metodo) VALUES (id_venta, monto, metodo);
END;
$$;

CREATE OR REPLACE FUNCTION paquete_pago.fn_monto_pagado_venta(p_id_venta int)
RETURNS decimal AS $$
DECLARE
  v_monto decimal;
BEGIN
  SELECT COALESCE(SUM(monto),0) INTO v_monto FROM "Pago" WHERE id_venta = p_id_venta;
  RETURN v_monto;
END;
$$ LANGUAGE plpgsql;


-- paquete_rol
CREATE SCHEMA IF NOT EXISTS paquete_rol;

CREATE OR REPLACE FUNCTION paquete_rol.fn_get_nombre_rol(p_id int)
RETURNS varchar AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre_rol INTO v_nombre FROM "Rol" WHERE id_rol = p_id;
  RETURN v_nombre;
END;
$$ LANGUAGE plpgsql;


-- paquete_otros
CREATE SCHEMA IF NOT EXISTS paquete_otros;

CREATE OR REPLACE FUNCTION paquete_otros.fn_get_descripcion_producto(p_id int)
RETURNS text AS $$
DECLARE
  v_desc text;
BEGIN
  SELECT descripcion INTO v_desc FROM "Producto" WHERE id_producto = p_id;
  RETURN v_desc;
END;
$$ LANGUAGE plpgsql;