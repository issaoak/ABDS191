--inner join

SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM Compras c 
JOIN Clientes cl On c.id_cliente = cl.id_cliente;

--left

SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM Compras c 
LEFT JOIN Clientes cl On c.id_cliente = cl.id_cliente;

--right

SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM Compras c 
RIGHT JOIN Clientes cl On c.id_cliente = cl.id_cliente;


--full
SELECT *
FROM Clientes cl 
FULL JOIN Compras c 
ON c.id_cliente = cl.id_cliente;



