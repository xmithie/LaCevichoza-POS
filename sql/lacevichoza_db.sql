PGDMP  ,                     }           lacevichoza_db    17.5    17.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    lacevichoza_db    DATABASE     �   CREATE DATABASE lacevichoza_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Costa Rica.1252';
    DROP DATABASE lacevichoza_db;
                     postgres    false                        2615    16509    paquete_categoria    SCHEMA     !   CREATE SCHEMA paquete_categoria;
    DROP SCHEMA paquete_categoria;
                     postgres    false                        2615    16521    paquete_cliente    SCHEMA        CREATE SCHEMA paquete_cliente;
    DROP SCHEMA paquete_cliente;
                     postgres    false                        2615    16539    paquete_detalleventa    SCHEMA     $   CREATE SCHEMA paquete_detalleventa;
 "   DROP SCHEMA paquete_detalleventa;
                     postgres    false                        2615    16547    paquete_inventario    SCHEMA     "   CREATE SCHEMA paquete_inventario;
     DROP SCHEMA paquete_inventario;
                     postgres    false                        2615    16552    paquete_otros    SCHEMA        CREATE SCHEMA paquete_otros;
    DROP SCHEMA paquete_otros;
                     postgres    false                        2615    16544    paquete_pago    SCHEMA        CREATE SCHEMA paquete_pago;
    DROP SCHEMA paquete_pago;
                     postgres    false                        2615    16514    paquete_producto    SCHEMA         CREATE SCHEMA paquete_producto;
    DROP SCHEMA paquete_producto;
                     postgres    false                        2615    16550    paquete_rol    SCHEMA        CREATE SCHEMA paquete_rol;
    DROP SCHEMA paquete_rol;
                     postgres    false            	            2615    16527    paquete_usuario    SCHEMA        CREATE SCHEMA paquete_usuario;
    DROP SCHEMA paquete_usuario;
                     postgres    false            
            2615    16533    paquete_venta    SCHEMA        CREATE SCHEMA paquete_venta;
    DROP SCHEMA paquete_venta;
                     postgres    false            �            1255    16513     fn_get_nombre_categoria(integer)    FUNCTION     	  CREATE FUNCTION paquete_categoria.fn_get_nombre_categoria(p_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre INTO v_nombre FROM "Categoria" WHERE id_categoria = p_id;
  RETURN v_nombre;
END;
$$;
 G   DROP FUNCTION paquete_categoria.fn_get_nombre_categoria(p_id integer);
       paquete_categoria               postgres    false    6            �            1255    16511 9   sp_actualizar_categoria(integer, character varying, text) 	   PROCEDURE     '  CREATE PROCEDURE paquete_categoria.sp_actualizar_categoria(IN p_id_categoria integer, IN p_nombre character varying, IN p_descripcion text)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "Categoria" SET nombre = p_nombre, descripcion = p_descripcion WHERE id_categoria = p_id_categoria;
END;
$$;
 �   DROP PROCEDURE paquete_categoria.sp_actualizar_categoria(IN p_id_categoria integer, IN p_nombre character varying, IN p_descripcion text);
       paquete_categoria               postgres    false    6            �            1255    16512    sp_eliminar_categoria(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_categoria.sp_eliminar_categoria(IN p_id_categoria integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "Categoria" WHERE id_categoria = p_id_categoria;
END;
$$;
 S   DROP PROCEDURE paquete_categoria.sp_eliminar_categoria(IN p_id_categoria integer);
       paquete_categoria               postgres    false    6            �            1255    16510 .   sp_insertar_categoria(character varying, text) 	   PROCEDURE     �   CREATE PROCEDURE paquete_categoria.sp_insertar_categoria(IN p_nombre character varying, IN p_descripcion text)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Categoria"(nombre, descripcion) VALUES (p_nombre, p_descripcion);
END;
$$;
 n   DROP PROCEDURE paquete_categoria.sp_insertar_categoria(IN p_nombre character varying, IN p_descripcion text);
       paquete_categoria               postgres    false    6            	           1255    16526    fn_contar_clientes()    FUNCTION     �   CREATE FUNCTION paquete_cliente.fn_contar_clientes() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Cliente";
  RETURN v_count;
END;
$$;
 4   DROP FUNCTION paquete_cliente.fn_contar_clientes();
       paquete_cliente               postgres    false    8                       1255    16525     fn_get_telefono_cliente(integer)    FUNCTION     �   CREATE FUNCTION paquete_cliente.fn_get_telefono_cliente(p_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_tel varchar;
BEGIN
  SELECT telefono INTO v_tel FROM "Cliente" WHERE id_cliente = p_id;
  RETURN v_tel;
END;
$$;
 E   DROP FUNCTION paquete_cliente.fn_get_telefono_cliente(p_id integer);
       paquete_cliente               postgres    false    8                       1255    16523 W   sp_actualizar_cliente(integer, character varying, character varying, character varying) 	   PROCEDURE     Q  CREATE PROCEDURE paquete_cliente.sp_actualizar_cliente(IN p_id_cliente integer, IN p_nombre character varying, IN p_telefono character varying, IN p_correo character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "Cliente" SET nombre = p_nombre, telefono = p_telefono, correo = p_correo WHERE id_cliente = p_id_cliente;
END;
$$;
 �   DROP PROCEDURE paquete_cliente.sp_actualizar_cliente(IN p_id_cliente integer, IN p_nombre character varying, IN p_telefono character varying, IN p_correo character varying);
       paquete_cliente               postgres    false    8                       1255    16524    sp_eliminar_cliente(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_cliente.sp_eliminar_cliente(IN p_id_cliente integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "Cliente" WHERE id_cliente = p_id_cliente;
END;
$$;
 M   DROP PROCEDURE paquete_cliente.sp_eliminar_cliente(IN p_id_cliente integer);
       paquete_cliente               postgres    false    8                       1255    16522 L   sp_insertar_cliente(character varying, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE paquete_cliente.sp_insertar_cliente(IN p_nombre character varying, IN p_telefono character varying, IN p_correo character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Cliente"(nombre, telefono, correo) VALUES (p_nombre, p_telefono, p_correo);
END;
$$;
 �   DROP PROCEDURE paquete_cliente.sp_insertar_cliente(IN p_nombre character varying, IN p_telefono character varying, IN p_correo character varying);
       paquete_cliente               postgres    false    8            ,           1255    16596    sp_listar_clientes_cursor() 	   PROCEDURE     q  CREATE PROCEDURE paquete_cliente.sp_listar_clientes_cursor()
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR SELECT id_cliente, nombre FROM cliente;
  r_id INT;
  r_nombre VARCHAR;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO r_id, r_nombre;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Cliente ID: %, Nombre: %', r_id, r_nombre;
  END LOOP;
  CLOSE cur;
END;
$$;
 <   DROP PROCEDURE paquete_cliente.sp_listar_clientes_cursor();
       paquete_cliente               postgres    false    8            -           1255    16597    sp_ver_ventas_cliente(integer) 	   PROCEDURE     �  CREATE PROCEDURE paquete_cliente.sp_ver_ventas_cliente(IN p_id_cliente integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR SELECT id_venta, total FROM venta WHERE id_cliente = p_id_cliente;
  v_id INT;
  v_total DECIMAL;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id, v_total;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Venta ID: %, Total: %', v_id, v_total;
  END LOOP;
  CLOSE cur;
END;
$$;
 O   DROP PROCEDURE paquete_cliente.sp_ver_ventas_cliente(IN p_id_cliente integer);
       paquete_cliente               postgres    false    8                       1255    16543 %   fn_cantidad_vendida_producto(integer)    FUNCTION     1  CREATE FUNCTION paquete_detalleventa.fn_cantidad_vendida_producto(p_id_producto integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_cantidad int;
BEGIN
  SELECT COALESCE(SUM(cantidad), 0) INTO v_cantidad FROM "DetalleVenta" WHERE id_producto = p_id_producto;
  RETURN v_cantidad;
END;
$$;
 X   DROP FUNCTION paquete_detalleventa.fn_cantidad_vendida_producto(p_id_producto integer);
       paquete_detalleventa               postgres    false    11                       1255    16541 G   sp_actualizar_detalleventa(integer, integer, integer, integer, numeric) 	   PROCEDURE     �  CREATE PROCEDURE paquete_detalleventa.sp_actualizar_detalleventa(IN p_id_detalle integer, IN p_id_venta integer, IN p_id_producto integer, IN p_cantidad integer, IN p_precio_unitario numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "DetalleVenta"
  SET id_venta = p_id_venta,
      id_producto = p_id_producto,
      cantidad = p_cantidad,
      precio_unitario = p_precio_unitario
  WHERE id_detalle = p_id_detalle;
END;
$$;
 �   DROP PROCEDURE paquete_detalleventa.sp_actualizar_detalleventa(IN p_id_detalle integer, IN p_id_venta integer, IN p_id_producto integer, IN p_cantidad integer, IN p_precio_unitario numeric);
       paquete_detalleventa               postgres    false    11                       1255    16542 !   sp_eliminar_detalleventa(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_detalleventa.sp_eliminar_detalleventa(IN p_id_detalle integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "DetalleVenta" WHERE id_detalle = p_id_detalle;
END;
$$;
 W   DROP PROCEDURE paquete_detalleventa.sp_eliminar_detalleventa(IN p_id_detalle integer);
       paquete_detalleventa               postgres    false    11                       1255    16540 <   sp_insertar_detalleventa(integer, integer, integer, numeric) 	   PROCEDURE     g  CREATE PROCEDURE paquete_detalleventa.sp_insertar_detalleventa(IN p_id_venta integer, IN p_id_producto integer, IN p_cantidad integer, IN p_precio_unitario numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "DetalleVenta"(id_venta, id_producto, cantidad, precio_unitario)
  VALUES (p_id_venta, p_id_producto, p_cantidad, p_precio_unitario);
END;
$$;
 �   DROP PROCEDURE paquete_detalleventa.sp_insertar_detalleventa(IN p_id_venta integer, IN p_id_producto integer, IN p_cantidad integer, IN p_precio_unitario numeric);
       paquete_detalleventa               postgres    false    11            .           1255    16598    sp_listar_detalles_ventas() 	   PROCEDURE     m  CREATE PROCEDURE paquete_detalleventa.sp_listar_detalles_ventas()
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR
    SELECT dv.id_venta, p.nombre, dv.cantidad, dv.precio_unitario
    FROM detalleventa dv
    JOIN producto p ON p.id_producto = dv.id_producto;
  v_id_venta INT;
  v_producto TEXT;
  v_cantidad INT;
  v_precio DECIMAL;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id_venta, v_producto, v_cantidad, v_precio;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Venta % - Producto: %, Cant: %, Subtotal: %',
      v_id_venta, v_producto, v_cantidad, v_cantidad * v_precio;
  END LOOP;
  CLOSE cur;
END;
$$;
 A   DROP PROCEDURE paquete_detalleventa.sp_listar_detalles_ventas();
       paquete_detalleventa               postgres    false    11                       1255    16549    fn_stock_minimo(integer)    FUNCTION     �  CREATE FUNCTION paquete_inventario.fn_stock_minimo(p_id_producto integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_stock int;
  v_stock_minimo int;
BEGIN
  SELECT stock INTO v_stock FROM "Producto" WHERE id_producto = p_id_producto;
  SELECT stock_minimo INTO v_stock_minimo FROM "Inventario" WHERE id_producto = p_id_producto;
  RETURN v_stock <= v_stock_minimo;
END;
$$;
 I   DROP FUNCTION paquete_inventario.fn_stock_minimo(p_id_producto integer);
       paquete_inventario               postgres    false    13                       1255    16548    fn_total_productos_inventario()    FUNCTION     �   CREATE FUNCTION paquete_inventario.fn_total_productos_inventario() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_total int;
BEGIN
  SELECT COUNT(*) INTO v_total FROM "Inventario";
  RETURN v_total;
END;
$$;
 B   DROP FUNCTION paquete_inventario.fn_total_productos_inventario();
       paquete_inventario               postgres    false    13            !           1255    16553 $   fn_get_descripcion_producto(integer)    FUNCTION     �   CREATE FUNCTION paquete_otros.fn_get_descripcion_producto(p_id integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_desc text;
BEGIN
  SELECT descripcion INTO v_desc FROM "Producto" WHERE id_producto = p_id;
  RETURN v_desc;
END;
$$;
 G   DROP FUNCTION paquete_otros.fn_get_descripcion_producto(p_id integer);
       paquete_otros               postgres    false    15                       1255    16546    fn_monto_pagado_venta(integer)    FUNCTION     	  CREATE FUNCTION paquete_pago.fn_monto_pagado_venta(p_id_venta integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_monto decimal;
BEGIN
  SELECT COALESCE(SUM(monto), 0) INTO v_monto FROM "Pago" WHERE id_venta = p_id_venta;
  RETURN v_monto;
END;
$$;
 F   DROP FUNCTION paquete_pago.fn_monto_pagado_venta(p_id_venta integer);
       paquete_pago               postgres    false    12                       1255    16545 5   sp_insertar_pago(integer, numeric, character varying) 	   PROCEDURE     �   CREATE PROCEDURE paquete_pago.sp_insertar_pago(IN p_id_venta integer, IN p_monto numeric, IN p_metodo character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Pago"(id_venta, monto, metodo) VALUES (p_id_venta, p_monto, p_metodo);
END;
$$;
 x   DROP PROCEDURE paquete_pago.sp_insertar_pago(IN p_id_venta integer, IN p_monto numeric, IN p_metodo character varying);
       paquete_pago               postgres    false    12            0           1255    16600    sp_listar_pagos() 	   PROCEDURE     �  CREATE PROCEDURE paquete_pago.sp_listar_pagos()
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR SELECT id_venta, monto, metodo FROM pago;
  v_id INT;
  v_monto DECIMAL;
  v_metodo TEXT;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id, v_monto, v_metodo;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Venta ID: %, Monto: %, Método: %', v_id, v_monto, v_metodo;
  END LOOP;
  CLOSE cur;
END;
$$;
 /   DROP PROCEDURE paquete_pago.sp_listar_pagos();
       paquete_pago               postgres    false    12                       1255    16519    fn_get_precio_producto(integer)    FUNCTION     �   CREATE FUNCTION paquete_producto.fn_get_precio_producto(p_id integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_precio decimal;
BEGIN
  SELECT precio INTO v_precio FROM "Producto" WHERE id_producto = p_id;
  RETURN v_precio;
END;
$$;
 E   DROP FUNCTION paquete_producto.fn_get_precio_producto(p_id integer);
       paquete_producto               postgres    false    7                       1255    16518    fn_get_stock_producto(integer)    FUNCTION     �   CREATE FUNCTION paquete_producto.fn_get_stock_producto(p_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_stock int;
BEGIN
  SELECT stock INTO v_stock FROM "Producto" WHERE id_producto = p_id;
  RETURN v_stock;
END;
$$;
 D   DROP FUNCTION paquete_producto.fn_get_stock_producto(p_id integer);
       paquete_producto               postgres    false    7            �            1259    16399    producto    TABLE     �  CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    estado character(1) DEFAULT 'A'::bpchar,
    id_categoria integer,
    CONSTRAINT producto_estado_check CHECK ((estado = ANY (ARRAY['A'::bpchar, 'I'::bpchar]))),
    CONSTRAINT producto_precio_check CHECK ((precio > (0)::numeric)),
    CONSTRAINT producto_stock_check CHECK ((stock >= 0))
);
    DROP TABLE public.producto;
       public         heap r       postgres    false                       1255    16520    fn_listar_productos()    FUNCTION     �   CREATE FUNCTION paquete_producto.fn_listar_productos() RETURNS SETOF public.producto
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM "Producto";
END;
$$;
 6   DROP FUNCTION paquete_producto.fn_listar_productos();
       paquete_producto               postgres    false    230    7                        1255    16516 ^   sp_actualizar_producto(integer, character varying, text, numeric, integer, character, integer) 	   PROCEDURE     �  CREATE PROCEDURE paquete_producto.sp_actualizar_producto(IN p_id_producto integer, IN p_nombre character varying, IN p_descripcion text, IN p_precio numeric, IN p_stock integer, IN p_estado character, IN p_id_categoria integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "Producto" SET nombre = p_nombre, descripcion = p_descripcion, precio = p_precio, stock = p_stock, estado = p_estado, id_categoria = p_id_categoria
  WHERE id_producto = p_id_producto;
END;
$$;
 �   DROP PROCEDURE paquete_producto.sp_actualizar_producto(IN p_id_producto integer, IN p_nombre character varying, IN p_descripcion text, IN p_precio numeric, IN p_stock integer, IN p_estado character, IN p_id_categoria integer);
       paquete_producto               postgres    false    7            /           1255    16599    sp_aumentar_precios(numeric) 	   PROCEDURE     �  CREATE PROCEDURE paquete_producto.sp_aumentar_precios(IN p_porcentaje numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR SELECT id_producto, precio FROM producto;
  v_id INT;
  v_precio DECIMAL;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id, v_precio;
    EXIT WHEN NOT FOUND;
    UPDATE producto
    SET precio = precio + (precio * p_porcentaje / 100)
    WHERE id_producto = v_id;
  END LOOP;
  CLOSE cur;
END;
$$;
 N   DROP PROCEDURE paquete_producto.sp_aumentar_precios(IN p_porcentaje numeric);
       paquete_producto               postgres    false    7            1           1255    16601 "   sp_detectar_productos_sin_ventas() 	   PROCEDURE     �  CREATE PROCEDURE paquete_producto.sp_detectar_productos_sin_ventas()
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR
    SELECT p.id_producto, p.nombre
    FROM producto p
    WHERE p.id_producto NOT IN (SELECT DISTINCT id_producto FROM detalleventa);
  v_id INT;
  v_nombre TEXT;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id, v_nombre;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Producto sin ventas: % (ID %)', v_nombre, v_id;
  END LOOP;
  CLOSE cur;
END;
$$;
 D   DROP PROCEDURE paquete_producto.sp_detectar_productos_sin_ventas();
       paquete_producto               postgres    false    7                       1255    16517    sp_eliminar_producto(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_producto.sp_eliminar_producto(IN p_id_producto integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "Producto" WHERE id_producto = p_id_producto;
END;
$$;
 P   DROP PROCEDURE paquete_producto.sp_eliminar_producto(IN p_id_producto integer);
       paquete_producto               postgres    false    7            �            1255    16515 S   sp_insertar_producto(character varying, text, numeric, integer, character, integer) 	   PROCEDURE     �  CREATE PROCEDURE paquete_producto.sp_insertar_producto(IN p_nombre character varying, IN p_descripcion text, IN p_precio numeric, IN p_stock integer, IN p_estado character, IN p_id_categoria integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Producto"(nombre, descripcion, precio, stock, estado, id_categoria)
  VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_estado, p_id_categoria);
END;
$$;
 �   DROP PROCEDURE paquete_producto.sp_insertar_producto(IN p_nombre character varying, IN p_descripcion text, IN p_precio numeric, IN p_stock integer, IN p_estado character, IN p_id_categoria integer);
       paquete_producto               postgres    false    7                       1255    16551    fn_get_nombre_rol(integer)    FUNCTION     �   CREATE FUNCTION paquete_rol.fn_get_nombre_rol(p_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre_rol INTO v_nombre FROM "Rol" WHERE id_rol = p_id;
  RETURN v_nombre;
END;
$$;
 ;   DROP FUNCTION paquete_rol.fn_get_nombre_rol(p_id integer);
       paquete_rol               postgres    false    14                       1255    16532    fn_get_nombre_rol(integer)    FUNCTION     �   CREATE FUNCTION paquete_usuario.fn_get_nombre_rol(p_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_nombre varchar;
BEGIN
  SELECT nombre_rol INTO v_nombre FROM "Rol" WHERE id_rol = p_id;
  RETURN v_nombre;
END;
$$;
 ?   DROP FUNCTION paquete_usuario.fn_get_nombre_rol(p_id integer);
       paquete_usuario               postgres    false    9                       1255    16531 $   fn_usuario_existe(character varying)    FUNCTION       CREATE FUNCTION paquete_usuario.fn_usuario_existe(p_usuario character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Usuario" WHERE usuario = p_usuario;
  RETURN v_count > 0;
END;
$$;
 N   DROP FUNCTION paquete_usuario.fn_usuario_existe(p_usuario character varying);
       paquete_usuario               postgres    false    9                       1255    16529 `   sp_actualizar_usuario(integer, character varying, character varying, character varying, integer) 	   PROCEDURE     s  CREATE PROCEDURE paquete_usuario.sp_actualizar_usuario(IN p_id_usuario integer, IN p_nombre character varying, IN p_usuario character varying, IN p_clave character varying, IN p_id_rol integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "Usuario" SET nombre = p_nombre, usuario = p_usuario, clave = p_clave, id_rol = p_id_rol WHERE id_usuario = p_id_usuario;
END;
$$;
 �   DROP PROCEDURE paquete_usuario.sp_actualizar_usuario(IN p_id_usuario integer, IN p_nombre character varying, IN p_usuario character varying, IN p_clave character varying, IN p_id_rol integer);
       paquete_usuario               postgres    false    9                       1255    16530    sp_eliminar_usuario(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_usuario.sp_eliminar_usuario(IN p_id_usuario integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "Usuario" WHERE id_usuario = p_id_usuario;
END;
$$;
 M   DROP PROCEDURE paquete_usuario.sp_eliminar_usuario(IN p_id_usuario integer);
       paquete_usuario               postgres    false    9            
           1255    16528 U   sp_insertar_usuario(character varying, character varying, character varying, integer) 	   PROCEDURE     >  CREATE PROCEDURE paquete_usuario.sp_insertar_usuario(IN p_nombre character varying, IN p_usuario character varying, IN p_clave character varying, IN p_id_rol integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Usuario"(nombre, usuario, clave, id_rol) VALUES (p_nombre, p_usuario, p_clave, p_id_rol);
END;
$$;
 �   DROP PROCEDURE paquete_usuario.sp_insertar_usuario(IN p_nombre character varying, IN p_usuario character varying, IN p_clave character varying, IN p_id_rol integer);
       paquete_usuario               postgres    false    9                       1255    16538 #   fn_cantidad_ventas_usuario(integer)    FUNCTION       CREATE FUNCTION paquete_venta.fn_cantidad_ventas_usuario(p_id_usuario integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Venta" WHERE id_usuario = p_id_usuario;
  RETURN v_count;
END;
$$;
 N   DROP FUNCTION paquete_venta.fn_cantidad_ventas_usuario(p_id_usuario integer);
       paquete_venta               postgres    false    10                       1255    16537     fn_total_ventas_cliente(integer)    FUNCTION       CREATE FUNCTION paquete_venta.fn_total_ventas_cliente(p_id_cliente integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_total decimal;
BEGIN
  SELECT COALESCE(SUM(total),0) INTO v_total FROM "Venta" WHERE id_cliente = p_id_cliente;
  RETURN v_total;
END;
$$;
 K   DROP FUNCTION paquete_venta.fn_total_ventas_cliente(p_id_cliente integer);
       paquete_venta               postgres    false    10                       1255    16535 g   sp_actualizar_venta(integer, timestamp without time zone, numeric, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE paquete_venta.sp_actualizar_venta(IN p_id_venta integer, IN p_fecha timestamp without time zone, IN p_total numeric, IN p_estado character varying, IN p_id_cliente integer, IN p_id_usuario integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "Venta" SET fecha = p_fecha, total = p_total, estado = p_estado, id_cliente = p_id_cliente, id_usuario = p_id_usuario WHERE id_venta = p_id_venta;
END;
$$;
 �   DROP PROCEDURE paquete_venta.sp_actualizar_venta(IN p_id_venta integer, IN p_fecha timestamp without time zone, IN p_total numeric, IN p_estado character varying, IN p_id_cliente integer, IN p_id_usuario integer);
       paquete_venta               postgres    false    10                       1255    16536    sp_eliminar_venta(integer) 	   PROCEDURE     �   CREATE PROCEDURE paquete_venta.sp_eliminar_venta(IN p_id_venta integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM "Venta" WHERE id_venta = p_id_venta;
END;
$$;
 G   DROP PROCEDURE paquete_venta.sp_eliminar_venta(IN p_id_venta integer);
       paquete_venta               postgres    false    10                       1255    16534 \   sp_insertar_venta(timestamp without time zone, numeric, character varying, integer, integer) 	   PROCEDURE     q  CREATE PROCEDURE paquete_venta.sp_insertar_venta(IN p_fecha timestamp without time zone, IN p_total numeric, IN p_estado character varying, IN p_id_cliente integer, IN p_id_usuario integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "Venta"(fecha, total, estado, id_cliente, id_usuario) VALUES (p_fecha, p_total, p_estado, p_id_cliente, p_id_usuario);
END;
$$;
 �   DROP PROCEDURE paquete_venta.sp_insertar_venta(IN p_fecha timestamp without time zone, IN p_total numeric, IN p_estado character varying, IN p_id_cliente integer, IN p_id_usuario integer);
       paquete_venta               postgres    false    10            2           1255    16602    sp_resumen_ventas_dia() 	   PROCEDURE     �  CREATE PROCEDURE paquete_venta.sp_resumen_ventas_dia()
    LANGUAGE plpgsql
    AS $$
DECLARE
  cur CURSOR FOR
    SELECT id_venta, total FROM venta WHERE DATE(fecha) = CURRENT_DATE;
  v_id INT;
  v_total DECIMAL;
BEGIN
  OPEN cur;
  LOOP
    FETCH cur INTO v_id, v_total;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Venta ID: %, Total: %', v_id, v_total;
  END LOOP;
  CLOSE cur;
END;
$$;
 6   DROP PROCEDURE paquete_venta.sp_resumen_ventas_dia();
       paquete_venta               postgres    false    10            )           1255    16590    actualizar_stock()    FUNCTION     �   CREATE FUNCTION public.actualizar_stock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE "producto"
  SET stock = stock - NEW.cantidad
  WHERE id_producto = NEW.id_producto;
  RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.actualizar_stock();
       public               postgres    false            *           1255    16592    alerta_stock_minimo()    FUNCTION     �  CREATE FUNCTION public.alerta_stock_minimo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_stock INT;
  v_minimo INT;
BEGIN
  SELECT stock, stock_minimo INTO v_stock, v_minimo
  FROM producto p
  JOIN inventario i ON p.id_producto = i.id_producto
  WHERE p.id_producto = NEW.id_producto;

  IF v_stock <= v_minimo THEN
    RAISE NOTICE 'Producto ID % está por debajo del stock mínimoo.', NEW.id_producto;
  END IF;

  RETURN NULL;
END;
$$;
 ,   DROP FUNCTION public.alerta_stock_minimo();
       public               postgres    false            +           1255    16594    evitar_venta_sin_stock()    FUNCTION     c  CREATE FUNCTION public.evitar_venta_sin_stock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_stock INT;
BEGIN
  SELECT stock INTO v_stock FROM producto WHERE id_producto = NEW.id_producto;
  IF NEW.cantidad > v_stock THEN
    RAISE EXCEPTION 'No hay suficiente stock para el producto ID %', NEW.id_producto;
  END IF;
  RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.evitar_venta_sin_stock();
       public               postgres    false            �            1259    16390 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    16389    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public               postgres    false    228            �           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;
          public               postgres    false    227            �            1259    16417    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    correo character varying(100)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    16416    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public               postgres    false    232            �           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public               postgres    false    231            �            1259    16467    detalleventa    TABLE     r  CREATE TABLE public.detalleventa (
    id_detalle integer NOT NULL,
    id_venta integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    CONSTRAINT detalleventa_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT detalleventa_precio_unitario_check CHECK ((precio_unitario >= (0)::numeric))
);
     DROP TABLE public.detalleventa;
       public         heap r       postgres    false            �            1259    16466    detalleventa_id_detalle_seq    SEQUENCE     �   CREATE SEQUENCE public.detalleventa_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.detalleventa_id_detalle_seq;
       public               postgres    false    240            �           0    0    detalleventa_id_detalle_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.detalleventa_id_detalle_seq OWNED BY public.detalleventa.id_detalle;
          public               postgres    false    239            �            1259    16485 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    id_producto integer NOT NULL,
    stock_minimo integer NOT NULL,
    unidad_medida character varying(20) NOT NULL,
    CONSTRAINT inventario_stock_minimo_check CHECK ((stock_minimo >= 0))
);
    DROP TABLE public.inventario;
       public         heap r       postgres    false            �            1259    16497    pago    TABLE     �   CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_venta integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    metodo character varying(50) NOT NULL,
    CONSTRAINT pago_monto_check CHECK ((monto >= (0)::numeric))
);
    DROP TABLE public.pago;
       public         heap r       postgres    false            �            1259    16496    pago_id_pago_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pago_id_pago_seq;
       public               postgres    false    243            �           0    0    pago_id_pago_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;
          public               postgres    false    242            �            1259    16398    producto_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.producto_id_producto_seq;
       public               postgres    false    230            �           0    0    producto_id_producto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;
          public               postgres    false    229            �            1259    16424    rol    TABLE     h   CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);
    DROP TABLE public.rol;
       public         heap r       postgres    false            �            1259    16423    rol_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public               postgres    false    234            �           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;
          public               postgres    false    233            �            1259    16433    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    usuario character varying(50) NOT NULL,
    clave character varying(255) NOT NULL,
    id_rol integer
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    16432    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public               postgres    false    236            �           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public               postgres    false    235            �            1259    16447    venta    TABLE     n  CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    total numeric(10,2) NOT NULL,
    estado character varying(20) DEFAULT 'finalizada'::character varying,
    id_cliente integer,
    id_usuario integer NOT NULL,
    CONSTRAINT venta_total_check CHECK ((total >= (0)::numeric))
);
    DROP TABLE public.venta;
       public         heap r       postgres    false            �            1259    16446    venta_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.venta_id_venta_seq;
       public               postgres    false    238            �           0    0    venta_id_venta_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.venta_id_venta_seq OWNED BY public.venta.id_venta;
          public               postgres    false    237            �            1259    16575    vista_clientes_frecuentes    VIEW     <  CREATE VIEW public.vista_clientes_frecuentes AS
 SELECT c.id_cliente,
    c.nombre,
    count(v.id_venta) AS cantidad_compras
   FROM (public.cliente c
     JOIN public.venta v ON ((c.id_cliente = v.id_cliente)))
  GROUP BY c.id_cliente, c.nombre
 HAVING (count(v.id_venta) > 1)
  ORDER BY (count(v.id_venta)) DESC;
 ,   DROP VIEW public.vista_clientes_frecuentes;
       public       v       postgres    false    232    238    238    232            �            1259    16579    vista_inventario_actual    VIEW     �   CREATE VIEW public.vista_inventario_actual AS
 SELECT p.id_producto,
    p.nombre,
    p.stock,
    i.unidad_medida,
    p.estado
   FROM (public.producto p
     JOIN public.inventario i ON ((p.id_producto = i.id_producto)));
 *   DROP VIEW public.vista_inventario_actual;
       public       v       postgres    false    241    230    230    230    230    241            �            1259    16567    vista_productos_mas_vendidos    VIEW     )  CREATE VIEW public.vista_productos_mas_vendidos AS
 SELECT p.id_producto,
    p.nombre,
    sum(dv.cantidad) AS total_vendidos
   FROM (public.detalleventa dv
     JOIN public.producto p ON ((dv.id_producto = p.id_producto)))
  GROUP BY p.id_producto, p.nombre
  ORDER BY (sum(dv.cantidad)) DESC;
 /   DROP VIEW public.vista_productos_mas_vendidos;
       public       v       postgres    false    230    230    240    240            �            1259    16558    vista_productos_stock_bajo    VIEW     �   CREATE VIEW public.vista_productos_stock_bajo AS
 SELECT p.id_producto,
    p.nombre,
    p.stock,
    i.stock_minimo
   FROM (public.producto p
     JOIN public.inventario i ON ((p.id_producto = i.id_producto)))
  WHERE (p.stock <= i.stock_minimo);
 -   DROP VIEW public.vista_productos_stock_bajo;
       public       v       postgres    false    230    230    241    241    230            �            1259    16562    vista_ventas_detalladas    VIEW     .  CREATE VIEW public.vista_ventas_detalladas AS
 SELECT v.id_venta,
    v.fecha,
    c.nombre AS cliente,
    u.nombre AS vendedor,
    d.id_producto,
    p.nombre AS producto,
    d.cantidad,
    d.precio_unitario,
    ((d.cantidad)::numeric * d.precio_unitario) AS subtotal
   FROM ((((public.venta v
     JOIN public.cliente c ON ((v.id_cliente = c.id_cliente)))
     JOIN public.usuario u ON ((v.id_usuario = u.id_usuario)))
     JOIN public.detalleventa d ON ((v.id_venta = d.id_venta)))
     JOIN public.producto p ON ((d.id_producto = p.id_producto)));
 *   DROP VIEW public.vista_ventas_detalladas;
       public       v       postgres    false    232    230    230    240    240    240    240    238    238    232    236    236    238    238            �            1259    16571    vista_ventas_por_dia    VIEW     �   CREATE VIEW public.vista_ventas_por_dia AS
 SELECT date(fecha) AS dia,
    count(*) AS total_ventas,
    sum(total) AS monto_total
   FROM public.venta
  GROUP BY (date(fecha))
  ORDER BY (date(fecha)) DESC;
 '   DROP VIEW public.vista_ventas_por_dia;
       public       v       postgres    false    238    238            �            1259    16583    vista_ventas_por_usuario    VIEW     ?  CREATE VIEW public.vista_ventas_por_usuario AS
 SELECT u.id_usuario,
    u.nombre AS vendedor,
    count(v.id_venta) AS total_ventas,
    sum(v.total) AS monto_total
   FROM (public.usuario u
     JOIN public.venta v ON ((u.id_usuario = v.id_usuario)))
  GROUP BY u.id_usuario, u.nombre
  ORDER BY (sum(v.total)) DESC;
 +   DROP VIEW public.vista_ventas_por_usuario;
       public       v       postgres    false    238    238    236    236    238                        2604    16393    categoria id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public               postgres    false    228    227    228                       2604    16420    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    231    232    232            	           2604    16470    detalleventa id_detalle    DEFAULT     �   ALTER TABLE ONLY public.detalleventa ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalleventa_id_detalle_seq'::regclass);
 F   ALTER TABLE public.detalleventa ALTER COLUMN id_detalle DROP DEFAULT;
       public               postgres    false    240    239    240            
           2604    16500    pago id_pago    DEFAULT     l   ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);
 ;   ALTER TABLE public.pago ALTER COLUMN id_pago DROP DEFAULT;
       public               postgres    false    243    242    243                       2604    16402    producto id_producto    DEFAULT     |   ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);
 C   ALTER TABLE public.producto ALTER COLUMN id_producto DROP DEFAULT;
       public               postgres    false    229    230    230                       2604    16427 
   rol id_rol    DEFAULT     h   ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public               postgres    false    234    233    234                       2604    16436    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    235    236    236                       2604    16450    venta id_venta    DEFAULT     p   ALTER TABLE ONLY public.venta ALTER COLUMN id_venta SET DEFAULT nextval('public.venta_id_venta_seq'::regclass);
 =   ALTER TABLE public.venta ALTER COLUMN id_venta DROP DEFAULT;
       public               postgres    false    237    238    238            �          0    16390 	   categoria 
   TABLE DATA           F   COPY public.categoria (id_categoria, nombre, descripcion) FROM stdin;
    public               postgres    false    228   "�       �          0    16417    cliente 
   TABLE DATA           G   COPY public.cliente (id_cliente, nombre, telefono, correo) FROM stdin;
    public               postgres    false    232   ?�       �          0    16467    detalleventa 
   TABLE DATA           d   COPY public.detalleventa (id_detalle, id_venta, id_producto, cantidad, precio_unitario) FROM stdin;
    public               postgres    false    240   \�       �          0    16485 
   inventario 
   TABLE DATA           N   COPY public.inventario (id_producto, stock_minimo, unidad_medida) FROM stdin;
    public               postgres    false    241   y�       �          0    16497    pago 
   TABLE DATA           @   COPY public.pago (id_pago, id_venta, monto, metodo) FROM stdin;
    public               postgres    false    243   ��       �          0    16399    producto 
   TABLE DATA           i   COPY public.producto (id_producto, nombre, descripcion, precio, stock, estado, id_categoria) FROM stdin;
    public               postgres    false    230   ��       �          0    16424    rol 
   TABLE DATA           1   COPY public.rol (id_rol, nombre_rol) FROM stdin;
    public               postgres    false    234   ��       �          0    16433    usuario 
   TABLE DATA           M   COPY public.usuario (id_usuario, nombre, usuario, clave, id_rol) FROM stdin;
    public               postgres    false    236   ��       �          0    16447    venta 
   TABLE DATA           W   COPY public.venta (id_venta, fecha, total, estado, id_cliente, id_usuario) FROM stdin;
    public               postgres    false    238   
�       �           0    0    categoria_id_categoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 1, false);
          public               postgres    false    227            �           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public               postgres    false    231            �           0    0    detalleventa_id_detalle_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.detalleventa_id_detalle_seq', 1, false);
          public               postgres    false    239            �           0    0    pago_id_pago_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pago_id_pago_seq', 1, false);
          public               postgres    false    242            �           0    0    producto_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.producto_id_producto_seq', 1, false);
          public               postgres    false    229            �           0    0    rol_id_rol_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rol_id_rol_seq', 1, false);
          public               postgres    false    233            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public               postgres    false    235            �           0    0    venta_id_venta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.venta_id_venta_seq', 1, false);
          public               postgres    false    237                       2606    16397    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    228                       2606    16422    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    232            $           2606    16474    detalleventa detalleventa_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_pkey PRIMARY KEY (id_detalle);
 H   ALTER TABLE ONLY public.detalleventa DROP CONSTRAINT detalleventa_pkey;
       public                 postgres    false    240            &           2606    16490    inventario inventario_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_producto);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public                 postgres    false    241            (           2606    16503    pago pago_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public                 postgres    false    243                       2606    16410    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    230                       2606    16431    rol rol_nombre_rol_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_nombre_rol_key UNIQUE (nombre_rol);
 @   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_nombre_rol_key;
       public                 postgres    false    234                       2606    16429    rol rol_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public                 postgres    false    234                       2606    16438    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    236                        2606    16440    usuario usuario_usuario_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_usuario_key;
       public                 postgres    false    236            "           2606    16455    venta venta_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public                 postgres    false    238            2           2620    16591 !   detalleventa trg_actualizar_stock    TRIGGER     �   CREATE TRIGGER trg_actualizar_stock AFTER INSERT ON public.detalleventa FOR EACH ROW EXECUTE FUNCTION public.actualizar_stock();
 :   DROP TRIGGER trg_actualizar_stock ON public.detalleventa;
       public               postgres    false    240    297            1           2620    16593     producto trg_alerta_stock_minimo    TRIGGER     �   CREATE TRIGGER trg_alerta_stock_minimo AFTER UPDATE ON public.producto FOR EACH ROW EXECUTE FUNCTION public.alerta_stock_minimo();
 9   DROP TRIGGER trg_alerta_stock_minimo ON public.producto;
       public               postgres    false    230    298            3           2620    16595 '   detalleventa trg_evitar_venta_sin_stock    TRIGGER     �   CREATE TRIGGER trg_evitar_venta_sin_stock BEFORE INSERT ON public.detalleventa FOR EACH ROW EXECUTE FUNCTION public.evitar_venta_sin_stock();
 @   DROP TRIGGER trg_evitar_venta_sin_stock ON public.detalleventa;
       public               postgres    false    240    299            -           2606    16480 *   detalleventa detalleventa_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 T   ALTER TABLE ONLY public.detalleventa DROP CONSTRAINT detalleventa_id_producto_fkey;
       public               postgres    false    230    240    4886            .           2606    16475 '   detalleventa detalleventa_id_venta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.detalleventa DROP CONSTRAINT detalleventa_id_venta_fkey;
       public               postgres    false    240    238    4898            /           2606    16491 &   inventario inventario_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 P   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_id_producto_fkey;
       public               postgres    false    230    241    4886            0           2606    16504    pago pago_id_venta_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta);
 A   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_id_venta_fkey;
       public               postgres    false    238    4898    243            )           2606    16411 #   producto producto_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);
 M   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_id_categoria_fkey;
       public               postgres    false    4884    230    228            *           2606    16441    usuario usuario_id_rol_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_rol_fkey;
       public               postgres    false    234    4892    236            +           2606    16456    venta venta_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 E   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_cliente_fkey;
       public               postgres    false    4888    232    238            ,           2606    16461    venta venta_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 E   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_usuario_fkey;
       public               postgres    false    236    238    4894            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     