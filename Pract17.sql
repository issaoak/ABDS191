--Procedimiento con transaccion para inseratr comics e añadir en el  inventario
CREATE PROCEDURE sp_InsertarComicsAct
@Nombre VARCHAR(100),
@Anio TINYINT,
@Precio DECIMAL(10,2),
@IdAutor BIGINT,
@CantidadDisponible INT,
@Disponibilidad BIT
AS 
BEGIN
BEGIN TRANSACTION
INSERT INTO Comics (nombre, anio, precio, id_autor) VALUES (@Nombre, @Anio, @Precio, @IdAutor)
INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES (SCOPE_IDENTITY(),@CantidadDisponible, @Disponibilidad)
COMMIT TRANSACTION;
END;

EXEC sp_InsertarComicsAct 'Batman: The Dark Knight Returns ', '86', '600.00', 300, '10', '1'
EXEC sp_InsertarComicsAct 'Sandman ', '96', '600.00', 303, '7', '1'
EXEC sp_InsertarComicsAct 'In the Shadow of No Towers', '04', '350.00', 302, '1', '1'

SELECT * FROM Comics;


--Procedimiento con trasaccion para insertar un usuario con una compra

CREATE PROCEDURE sp_InsertarUsuarioCom
@Nombre VARCHAR(100),
@CorreoElect NVARCHAR(255),
@Pass VARCHAR(255),
@FechasCompra DATE,
@Total DECIMAL(10,2)
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Clientes(nombre, correo_electronico, pass) VALUES(@Nombre, @CorreoElect, @Pass)
INSERT INTO Compras(id_cliente, fecha_compra, total) VALUES (SCOPE_IDENTITY(), @FechasCompra, @Total)
COMMIT TRANSACTION;
END;

EXEC sp_InsertarUsuarioCom 'Arturo', 'Artur128@gmail.com', 'ARttde', '2024-07-6', '929.00'
EXEC sp_InsertarUsuarioCom 'Pedro', 'Apedro128@gmail.com', 'dfbbtde', '2023-07-6', '785.00'
EXEC sp_InsertarUsuarioCom 'Regina', 'Regis128@gmail.com', 'A432e', '2024-08-6', '745.00'

SELECT * FROM Clientes;
SELECT * FROM Compras;



--Procedimiento con transaccion  para actualizar los datos del usuario y la fecha de compra y el total

CREATE PROCEDURE sp_Actualizar
@IdCliente BIGINT,
@Correo NVARCHAR(255),
@Pass VARCHAR(255),
@FechaCompra DATE,
@Total DECIMAL(10,2)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Clientes
SET correo_electronico =@Correo, pass = @Pass
WHERE id_cliente = @IdCliente
UPDATE Compras
SET fecha_compra = @FechaCompra, total = @Total
WHERE id_cliente = @IdCliente
COMMIT TRANSACTION;
END;

EXEC sp_Actualizar 1, 'Ruben@outlook.es', 'morss32', '2024-09-11', '695.00'
EXEC sp_Actualizar 8, 'Jesusss@outlook.es', 'jsejmo32', '2024-10-11', '709.00' 
EXEC sp_Actualizar 6, 'Paola@outlook.es', 'Paokrss32', '2024-09-11', '695.00' 

SELECT * FROM Clientes;
SELECT * FROM Compras;



--Procedimiento con transaccion para borrar cliente y sus compras

CREATE PROCEDURE sp_EliminarC
@IdCliente BIGINT
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM Compras
WHERE id_cliente =@IdCliente
DELETE Clientes 
WHERE id_cliente = @IdCliente
COMMIT TRANSACTION;
END;


EXEC sp_EliminarC 10002
EXEC sp_EliminarC 10003
EXEC sp_EliminarC 10004

SELECT * FROM Compras;
SELECT * FROM Clientes;


--Procedimiento con transaccion para elimina un comic y que se actualize en el inventario

CREATE PROCEDURE sp_EliminarComics
@IdComic BIGINT
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM Inventario
WHERE id_comic = @IdComic
DELETE FROM Comics
WHERE id_comic = @IdComic
COMMIT TRANSACTION;
END;

EXEC sp_EliminarComics 20
EXEC sp_EliminarComics 28
EXEC sp_EliminarComics 34

SELECT * FROM Comics;
SELECT * FROM Inventario;


