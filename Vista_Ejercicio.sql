CREATE VIEW Vista_Ejercicio_clase AS
SELECT Clientes.nombre AS CLIENTE, Clientes.correo_electronico AS correo_electronico, Compras.fecha_compra AS Fecha_Compra, Comics.nombre AS Comic_Nombre, Autores.nombre AS Autor_Nombre
FROM Compras
INNER JOIN Clientes ON Compras.id_cliente = Clientes.id_cliente
INNER JOIN Comic_Compras ON Compras.id_compra = Comic_Compras.id_compra
INNER JOIN Comics ON Comic_Compras.id_comic = Comics.id_comic
INNER JOIN Autores ON Comics.id_autor = Autores.id_autor;





