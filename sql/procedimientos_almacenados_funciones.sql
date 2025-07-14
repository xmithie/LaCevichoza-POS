CREATE SCHEMA IF NOT EXISTS paquete_categoria;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_insertar_categoria(p_nombre varchar, p_descripcion text)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Categoria"(nombre, descripcion) VALUES (p_nombre, p_descripcion);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_actualizar_categoria(p_id_categoria int, p_nombre varchar, p_descripcion text)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Categoria" SET nombre = p_nombre, descripcion = p_descripcion WHERE id_categoria = p_id_categoria;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_categoria.sp_eliminar_categoria(p_id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Categoria" WHERE id_categoria = p_id_categoria;
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


CREATE SCHEMA IF NOT EXISTS paquete_producto;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_insertar_producto(p_nombre varchar, p_descripcion text, p_precio decimal, p_stock int, p_estado char, p_id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Producto"(nombre, descripcion, precio, stock, estado, id_categoria)
  VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_estado, p_id_categoria);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_actualizar_producto(p_id_producto int, p_nombre varchar, p_descripcion text, p_precio decimal, p_stock int, p_estado char, p_id_categoria int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Producto" SET nombre = p_nombre, descripcion = p_descripcion, precio = p_precio, stock = p_stock, estado = p_estado, id_categoria = p_id_categoria
  WHERE id_producto = p_id_producto;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_producto.sp_eliminar_producto(p_id_producto int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Producto" WHERE id_producto = p_id_producto;
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

CREATE OR REPLACE FUNCTION paquete_producto.fn_listar_productos()
RETURNS SETOF Producto AS $$
BEGIN
  RETURN QUERY SELECT * FROM "Producto";
END;
$$ LANGUAGE plpgsql;


CREATE SCHEMA IF NOT EXISTS paquete_cliente;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_insertar_cliente(p_nombre varchar, p_telefono varchar, p_correo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Cliente"(nombre, telefono, correo) VALUES (p_nombre, p_telefono, p_correo);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_actualizar_cliente(p_id_cliente int, p_nombre varchar, p_telefono varchar, p_correo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Cliente" SET nombre = p_nombre, telefono = p_telefono, correo = p_correo WHERE id_cliente = p_id_cliente;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_eliminar_cliente(p_id_cliente int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Cliente" WHERE id_cliente = p_id_cliente;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_cliente.fn_get_telefono_cliente(p_id int)
RETURNS varchar AS $$
DECLARE
  v_tel varchar;
BEGIN
  SELECT telefono INTO v_tel FROM "Cliente" WHERE id_cliente = p_id;
  RETURN v_tel;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION paquete_cliente.fn_contar_clientes()
RETURNS int AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Cliente";
  RETURN v_count;
END;
$$ LANGUAGE plpgsql;


CREATE SCHEMA IF NOT EXISTS paquete_usuario;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_insertar_usuario(p_nombre varchar, p_usuario varchar, p_clave varchar, p_id_rol int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Usuario"(nombre, usuario, clave, id_rol) VALUES (p_nombre, p_usuario, p_clave, p_id_rol);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_actualizar_usuario(p_id_usuario int, p_nombre varchar, p_usuario varchar, p_clave varchar, p_id_rol int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Usuario" SET nombre = p_nombre, usuario = p_usuario, clave = p_clave, id_rol = p_id_rol WHERE id_usuario = p_id_usuario;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_usuario.sp_eliminar_usuario(p_id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Usuario" WHERE id_usuario = p_id_usuario;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_usuario.fn_usuario_existe(p_usuario varchar)
RETURNS boolean AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Usuario" WHERE usuario = p_usuario;
  RETURN v_count > 0;
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


CREATE SCHEMA IF NOT EXISTS paquete_venta;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_insertar_venta(p_fecha timestamp, p_total decimal, p_estado varchar, p_id_cliente int, p_id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Venta"(fecha, total, estado, id_cliente, id_usuario) VALUES (p_fecha, p_total, p_estado, p_id_cliente, p_id_usuario);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_actualizar_venta(p_id_venta int, p_fecha timestamp, p_total decimal, p_estado varchar, p_id_cliente int, p_id_usuario int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "Venta" SET fecha = p_fecha, total = p_total, estado = p_estado, id_cliente = p_id_cliente, id_usuario = p_id_usuario WHERE id_venta = p_id_venta;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_venta.sp_eliminar_venta(p_id_venta int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "Venta" WHERE id_venta = p_id_venta;
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



CREATE SCHEMA IF NOT EXISTS paquete_detalleventa;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_insertar_detalleventa(p_id_venta int, p_id_producto int, p_cantidad int, p_precio_unitario decimal)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "DetalleVenta"(id_venta, id_producto, cantidad, precio_unitario)
  VALUES (p_id_venta, p_id_producto, p_cantidad, p_precio_unitario);
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_actualizar_detalleventa(p_id_detalle int, p_id_venta int, p_id_producto int, p_cantidad int, p_precio_unitario decimal)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE "DetalleVenta"
  SET id_venta = p_id_venta,
      id_producto = p_id_producto,
      cantidad = p_cantidad,
      precio_unitario = p_precio_unitario
  WHERE id_detalle = p_id_detalle;
END;
$$;

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_eliminar_detalleventa(p_id_detalle int)
LANGUAGE plpgsql AS $$
BEGIN
  DELETE FROM "DetalleVenta" WHERE id_detalle = p_id_detalle;
END;
$$;

CREATE OR REPLACE FUNCTION paquete_detalleventa.fn_cantidad_vendida_producto(p_id_producto int)
RETURNS int AS $$
DECLARE
  v_cantidad int;
BEGIN
  SELECT COALESCE(SUM(cantidad), 0) INTO v_cantidad FROM "DetalleVenta" WHERE id_producto = p_id_producto;
  RETURN v_cantidad;
END;
$$ LANGUAGE plpgsql;


CREATE SCHEMA IF NOT EXISTS paquete_pago;

CREATE OR REPLACE PROCEDURE paquete_pago.sp_insertar_pago(p_id_venta int, p_monto decimal, p_metodo varchar)
LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO "Pago"(id_venta, monto, metodo) VALUES (p_id_venta, p_monto, p_metodo);
END;
$$;

CREATE OR REPLACE FUNCTION paquete_pago.fn_monto_pagado_venta(p_id_venta int)
RETURNS decimal AS $$
DECLARE
  v_monto decimal;
BEGIN
  SELECT COALESCE(SUM(monto), 0) INTO v_monto FROM "Pago" WHERE id_venta = p_id_venta;
  RETURN v_monto;
END;
$$ LANGUAGE plpgsql;


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
  RETURN v_stock <= v_stock_minimo;
END;
$$ LANGUAGE plpgsql;


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