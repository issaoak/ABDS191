-- Procedimiento para inseratr Autores
SELECT * FROM Autores;

CREATE PROCEDURE sp_InsertarAutores
@Nombre VARCHAR(100),
@PaisOrigen VARCHAR(100)
AS
BEGIN
INSERT INTO Autores(nombre, pais_origen) VALUES(@Nombre, @PaisOrigen)
END;

EXEC sp_InsertarAutores 'Gabriel García Márquez', 'Colombiano'
EXEC sp_InsertarAutores 'Jane Austen', 'Británica'
EXEC sp_InsertarAutores 'Gabriel García Márquez', 'Checoslovaquia'


--Procedimiento para insertar Comics
SELECT * FROM Comics;

CREATE PROCEDURE sp_InsertarComics
@Nombre VARCHAR(100),
@Anio TINYINT,
@Precio DECIMAL(10,2),
@Id_autor INT
AS
BEGIN
INSERT INTO Comics(nombre,anio,precio,id_autor) VALUES(@Nombre, @Anio, @Precio, @Id_autor)
END;

EXEC sp_InsertarComics 'Macondo: Crónicas del Tiempo', '23', '320.00', '10301'
EXEC sp_InsertarComics 'Orgullo y Prejuicio: Una Aventura Romántica', '22', '250.00', '10302'
EXEC sp_InsertarComics 'El Proceso: Atrapado en el Laberinto', '24', '375.00', '10303'


--Procedimiento para editar Inventario
SELECT * FROM Inventario;

CREATE PROCEDURE sp_EditarInvemtario
@Id_Comic BIGINT,
@CantidadDisponible INT,
@Disponibilidad BIT
AS
BEGIN
UPDATE Inventario
SET cantidad_disponible =@CantidadDisponible, disponibilidad =@Disponibilidad
WHERE id_comic = @Id_Comic
END;

EXEC sp_EditarInvemtario 16, '3', '1'
EXEC sp_EditarInvemtario 24, '10', '1'
EXEC sp_EditarInvemtario 28, '0', '0'


--Procedimiento para editar Compras
SELECT * FROM Compras;

CREATE PROCEDURE sp_EditarCompras
@Id_Cliente BIGINT,
@FechaCompra DATE,
@Total DECIMAL(10,2)
AS
BEGIN
UPDATE Compras
SET fecha_compra =@FechaCompra, total =@Total
WHERE id_cliente = @Id_Cliente
END;

EXEC sp_EditarCompras 1, '2023-12-29', '320'
EXEC sp_EditarCompras 3, '2023-05-23', '375'
EXEC sp_EditarCompras 12, '2024-11-29', '250'



--Procedimientos para Comic Compras
SELECT * FROM Comic_Compras;

CREATE PROCEDURE sp_EliminaComicCompras
@Id_CC BIGINT
AS
BEGIN
DELETE FROM Comic_Compras
WHERE id_CC = @Id_CC;
END;


EXEC sp_EliminaComicCompras 1012
EXEC sp_EliminaComicCompras 1028
EXEC sp_EliminaComicCompras 1040


--Procedimiento para eliminar Autor

SELECT * FROM Autores;

CREATE PROCEDURE sp_EliminarAutor
@Id_Autor BIGINT
AS
BEGIN
DELETE FROM Comics
WHERE id_autor = @Id_Autor;
DELETE FROM Autores
WHERE id_autor = @Id_Autor;
END;



EXEC sp_EliminarAutor 10302
EXEC sp_EliminarAutor 10303
EXEC sp_EliminarAutor 10301


-- Procedimiento para consultar las compras de un cliente

SELECT * FROM Compras;

CREATE PROCEDURE sp_ConsultarCompras
@Id_Cliente BIGINT
AS
BEGIN
SELECT co.nombre AS NombreComic, cp.fecha_compra, cp.total
FROM Compras cp
JOIN Comic_Compras cc ON cp.id_compra = cc.id_compra
JOIN Comics co ON cc.id_comic = co.id_comic
WHERE cp.id_cliente = @Id_Cliente;
END;

EXEC sp_ConsultarCompras  10
EXEC sp_ConsultarCompras  4
EXEC sp_ConsultarCompras  7



--Procedimiento para consultar comics en inventario
SELECT * FROM Comics;

CREATE PROCEDURE sp_ConsultarComics
@NombreComic VARCHAR(100)
AS
BEGIN
SELECT co.nombre AS NombreComic, i.cantidad_disponible AS CantidadDisponible
FROM Comics co
JOIN Inventario i ON co.id_comic = i.id_comic
WHERE co.nombre =@NombreComic;
END;


EXEC sp_ConsultarComics 'Watchmen'
EXEC sp_ConsultarComics 'Akira'
EXEC sp_ConsultarComics 'V de Vendetta'


--Procedimiento para consultar compras por fecha

CREATE PROCEDURE sp_ConsultarFecha
@FechaCompra DATE
AS
BEGIN
SELECT c.nombre AS NombreCliente, co.nombre AS NombreComic, cp.fecha_compra, cc.cantidad, cp.total
FROM Compras cp
JOIN Comic_Compras cc ON cp.id_compra = cc.id_compra
JOIN Comics co ON cc.id_comic = co.id_comic
JOIN Clientes c ON cp.id_cliente = c.id_cliente
WHERE cp.fecha_compra = @fechaCompra;
END;

EXEC sp_ConsultarFecha '2023-12-29'
EXEC sp_ConsultarFecha '2024-01-15'
EXEC sp_ConsultarFecha '2024-02-27'
