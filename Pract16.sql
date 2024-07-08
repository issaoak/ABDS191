--Procedimiento insertar peliculas
CREATE PROCEDURE sp_InsertarPeliculas
@Titulo NVARCHAR(100),
@Genero NVARCHAR(50),
@FechaEstreno DATE,
@IdUsuario INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) VALUES (@Titulo, @Genero, @FechaEstreno)
INSERT INTO HistoriaVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion) VALUES(@IdUsuario,SCOPE_IDENTITY(),GETDATE())
COMMIT TRANSACTION;
END;

EXEC sp_InsertarPeliculas 'Batman El Caballero de la Noche Asciende', 'Accion', '2012-07-27', 5
EXEC sp_InsertarPeliculas 'Avatar: The Way of Water','Ciencia Ficcion', '2022-12-16', 6
EXEC sp_InsertarPeliculas 'Top Gun: Maverick', 'Accion', '2022-05-27', 8

SELECT * FROM Peliculas;
SELECT * FROM HistoriaVisualizacion;

--Procedimiento insertar usuario

CREATE PROCEDURE sp_InsertarUsuarios
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@Passw NVARCHAR(100),
@TipoSuscripcion NVARCHAR(50),
@IdPelicula INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro) VALUES(@Nombre, @Email, @Passw, GETDATE())
INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo)VALUES (SCOPE_IDENTITY(),GETDATE(),NULL, @TipoSuscripcion)
INSERT INTO HistoriaVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion) VALUES (SCOPE_IDENTITY(), @IdPelicula, GETDATE())
COMMIT TRANSACTION;
END;


EXEC sp_InsertarUsuarios 'Isidro Martinez', 'Isi@gmail.com', '1234567', 'Mensual', 3
EXEC sp_InsertarUsuarios 'Emilio Martinez', 'Emi@gmail.com', '12353567', 'Mensual', 7
EXEC sp_InsertarUsuarios 'Ruben Martinez', 'Rub@gmail.com', '123244567', 'Trimestral', 8

SELECT * FROM Usuarios;
SELECT * FROM Suscripciones;
SELECT * FROM HistoriaVisualizacion;

--Procedimiento  actualizar correo

CREATE PROCEDURE sp_ActualizarCorreo
@IdUsuario INT,
@Email NVARCHAR(100)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Usuarios
SET Email = @Email
WHERE UsuarioID = @IdUsuario
UPDATE Suscripciones
SET Tipo = 'Anual'
WHERE UsuarioID = @IdUsuario
COMMIT TRANSACTION;
END;

EXEC sp_ActualizarCorreo 7, 'Perlitas@gmail.com'
EXEC sp_ActualizarCorreo 8, 'Mateus@outlook.es'
EXEC sp_ActualizarCorreo 1002, 'Karlagas@gmail.com'

SELECT * FROM Usuarios;







--Procedimiento eliminar pelicula
CREATE PROCEDURE sp_EliminarPelicula
@IdPelicula INT
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM HistoriaVisualizacion
WHERE PeliculaID = @IdPelicula
DELETE FROM Peliculas
WHERE PeliculaID = @IdPelicula
COMMIT TRANSACTION;
END;


EXEC sp_EliminarPelicula 1007
EXEC sp_EliminarPelicula 10
EXEC sp_EliminarPelicula 7

SELECT * FROM Peliculas;
SELECT * FROM HistoriaVisualizacion;






--Procedimiento eliminar usuario con suscripciones
CREATE PROCEDURE sp_EliminarUsuarioSUS
@Id_usuario INT
AS 
BEGIN
BEGIN TRANSACTION
DELETE FROM HistoriaVisualizacion
WHERE UsuarioID = @Id_usuario
DELETE FROM Suscripciones
WHERE UsuarioID = @Id_usuario
DELETE FROM Usuarios
WHERE UsuarioID = @Id_usuario
COMMIT TRANSACTION;
END;



EXEC sp_EliminarUsuarioSUS 7
EXEC sp_EliminarUsuarioSUS 9
EXEC sp_EliminarUsuarioSUS 11

SELECT * FROM Usuarios;
SELECT * FROM Suscripciones;
SELECT *FROM HistoriaVisualizacion;


