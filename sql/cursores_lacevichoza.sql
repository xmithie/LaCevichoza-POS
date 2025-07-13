
--Listar todos los clientes 

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_listar_clientes_cursor()
LANGUAGE plpgsql AS $$
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


--Ver ventas por cliente

CREATE OR REPLACE PROCEDURE paquete_cliente.sp_ver_ventas_cliente(p_id_cliente INT)
LANGUAGE plpgsql AS $$
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


--Listar detalles de ventas

CREATE OR REPLACE PROCEDURE paquete_detalleventa.sp_listar_detalles_ventas()
LANGUAGE plpgsql AS $$
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


--Aumentar precios de productos

CREATE OR REPLACE PROCEDURE paquete_producto.sp_aumentar_precios(p_porcentaje DECIMAL)
LANGUAGE plpgsql AS $$
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


--Listar pagos realizados

CREATE OR REPLACE PROCEDURE paquete_pago.sp_listar_pagos()
LANGUAGE plpgsql AS $$
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


--Detectar productos sin ventas

CREATE OR REPLACE PROCEDURE paquete_producto.sp_detectar_productos_sin_ventas()
LANGUAGE plpgsql AS $$
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


--Resumen de ventas del día

CREATE OR REPLACE PROCEDURE paquete_venta.sp_resumen_ventas_dia()
LANGUAGE plpgsql AS $$
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