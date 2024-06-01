SELECT * FROM Inventario;
SELECT * FROM Comics;

SELECT c.nombre AS Comics, i.cantidad_disponible
FROM Inventario i
JOIN Comics c ON i.id_comic = c.id_comic;




SELECT c.nombre AS nombre_cliente, cc.id_compra, co.nombre AS nombre_comic, cc.cantidad
FROM Clientes c
JOIN Compras cp ON c.id_cliente = cp.id_cliente
JOIN Comic_Compras cc ON cp.id_compra = cc.id_compra
JOIN Comics co ON cc.id_comic = co.id_comic;


SELECT cp.id_compra, co.nombre AS nombre_comic, inv.cantidad_disponible
FROM Comics co
LEFT JOIN Inventario inv ON co.id_comic = inv.id_comic
LEFT JOIN Comic_Compras cc ON co.id_comic = cc.id_comic
LEFT JOIN Compras cp ON cc.id_compra = cp.id_compra;

SELECT co.nombre AS nombre_comic, inv.cantidad_disponible
FROM Comics co
JOIN Inventario inv ON co.id_comic = inv.id_comic;



SELECT co.id_comic, co.nombre AS nombre_comic, co.anio, co.precio, inv.id_inventario, inv.cantidad_disponible, inv.disponibilidad, cc.id_CC,cc.cantidad, cc.id_compra, cc.id_comic AS id_comic_compra
FROM Comics co
LEFT JOIN Comic_Compras cc ON co.id_comic = cc.id_comic
LEFT JOIN Inventario inv ON co.id_comic = inv.id_comic;



SELECT cl.nombre AS cliente, cp.id_compra AS compra, co.nombre AS comic, cc.cantidad AS cantidad_compra, inv.cantidad_disponible AS en_inventario
FROM Clientes cl
JOIN Compras cp ON cl.id_cliente = cp.id_cliente
JOIN Comic_Compras cc ON cp.id_compra = cc.id_compra
JOIN Comics co ON cc.id_comic = co.id_comic
JOIN Inventario inv ON co.id_comic = inv.id_comic;

