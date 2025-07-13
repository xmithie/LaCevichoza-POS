--  Actualizar stock al insertar en DetalleVenta
CREATE OR REPLACE FUNCTION actualizar_stock()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE "producto"
  SET stock = stock - NEW.cantidad
  WHERE id_producto = NEW.id_producto;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON "detalleventa"
FOR EACH ROW
EXECUTE FUNCTION actualizar_stock();



-- Alerta por stock mínimo

CREATE OR REPLACE FUNCTION alerta_stock_minimo()
RETURNS TRIGGER AS $$
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
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_alerta_stock_minimo
AFTER UPDATE ON producto
FOR EACH ROW
EXECUTE FUNCTION alerta_stock_minimo();


-- Evitar ventas sin stock

CREATE OR REPLACE FUNCTION evitar_venta_sin_stock()
RETURNS TRIGGER AS $$
DECLARE
  v_stock INT;
BEGIN
  SELECT stock INTO v_stock FROM producto WHERE id_producto = NEW.id_producto;
  IF NEW.cantidad > v_stock THEN
    RAISE EXCEPTION 'No hay suficiente stock para el producto ID %', NEW.id_producto;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_evitar_venta_sin_stock
BEFORE INSERT ON detalleventa
FOR EACH ROW
EXECUTE FUNCTION evitar_venta_sin_stock();