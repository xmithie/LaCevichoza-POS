--Productos con stock bajo
CREATE OR REPLACE VIEW vista_productos_stock_bajo AS
SELECT p.id_producto, p.nombre, p.stock, i.stock_minimo
FROM "producto" p
JOIN "inventario" i ON p.id_producto = i.id_producto
WHERE p.stock <= i.stock_minimo;

--Ventas detalladas
CREATE OR REPLACE VIEW vista_ventas_detalladas AS
SELECT v.id_venta, v.fecha, c.nombre AS cliente, u.nombre AS vendedor,
       d.id_producto, p.nombre AS producto, d.cantidad, d.precio_unitario,
       (d.cantidad * d.precio_unitario) AS subtotal
FROM "venta" v
JOIN "cliente" c ON v.id_cliente = c.id_cliente
JOIN "usuario" u ON v.id_usuario = u.id_usuario
JOIN "detalleventa" d ON v.id_venta = d.id_venta
JOIN "producto" p ON d.id_producto = p.id_producto;

--Productos más vendidos
CREATE OR REPLACE VIEW vista_productos_mas_vendidos AS
SELECT p.id_producto, p.nombre, SUM(dv.cantidad) AS total_vendidos
FROM "detalleventa" dv
JOIN "producto" p ON dv.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY total_vendidos DESC;

--Ventas por día
CREATE OR REPLACE VIEW vista_ventas_por_dia AS
SELECT DATE(fecha) AS dia, COUNT(*) AS total_ventas, SUM(total) AS monto_total
FROM "venta"
GROUP BY DATE(fecha)
ORDER BY dia DESC;

--Clientes frecuentes
CREATE OR REPLACE VIEW vista_clientes_frecuentes AS
SELECT c.id_cliente, c.nombre, COUNT(v.id_venta) AS cantidad_compras
FROM "cliente" c
JOIN "venta" v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(v.id_venta) > 1
ORDER BY cantidad_compras DESC;

--Inventario actual
CREATE OR REPLACE VIEW vista_inventario_actual AS
SELECT p.id_producto, p.nombre, p.stock, i.unidad_medida, p.estado
FROM "producto" p
JOIN "inventario" i ON p.id_producto = i.id_producto;

--Ventas por usuario
CREATE OR REPLACE VIEW vista_ventas_por_usuario AS
SELECT u.id_usuario, u.nombre AS vendedor, COUNT(v.id_venta) AS total_ventas, SUM(v.total) AS monto_total
FROM "usuario" u
JOIN "venta" v ON u.id_usuario = v.id_usuario
GROUP BY u.id_usuario, u.nombre
ORDER BY monto_total DESC;
