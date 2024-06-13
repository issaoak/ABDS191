CREATE VIEW Vista_ComprasComic AS
SELECT CC.id_CC, CC.cantidad, Co.nombre AS nombre_comic, C.id_compra, C.fecha_compra, C.total
FROM Comic_Compras CC
JOIN Compras C ON CC.id_compra = C.id_compra
JOIN Comics Co ON CC.id_comic = Co.id_comic;



CREATE VIEW Vista_ComicsComprados AS
SELECT  Cl.id_cliente, Cl.nombre AS nombre_cliente, COUNT(CC.id_comic) AS cantidad_comics_comprados
FROM  Clientes Cl
JOIN  Compras C ON Cl.id_cliente = C.id_cliente
JOIN  Comic_Compras CC ON C.id_compra = CC.id_compra
GROUP BY  Cl.id_cliente, Cl.nombre;

SELECT * FROM Vista_ComicsComprados;

CREATE VIEW Vista_AutoresComics AS
SELECT A.id_autor, A.nombre AS nombre_autor, A.pais_origen, C.id_comic, C.nombre AS nombre_comic, C.anio, C.precio
FROM Autores A
JOIN Comics C ON A.id_autor = C.id_autor;

SELECT * FROM Vista_AutoresComics;



