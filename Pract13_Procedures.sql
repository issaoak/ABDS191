CREATE PROCEDURE sp_InsertarUsuario
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@Pass NVARCHAR(100)
AS
BEGIN
DECLARE @FechaRegistro DATE = GETDATE();

INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES (@Nombre, @Email, @Pass, @FechaRegistro);
END;
SELECT * FROM Usuarios;
EXEC sp_InsertarUsuario 'Paola', 'Poal12@gmail.com', 'Pao183'
EXEC sp_InsertarUsuario 'Karla', 'Kalar34@gmail.com', 'Rolkas83'
EXEC sp_InsertarUsuario 'Monse', 'Monzz2@gmail.com', 'Gonms183'




SELECT * FROM Suscripciones;

CREATE PROCEDURE sp_EditarSuscripcion
@SuscripcionID INT,
@FechaInicio DATE,
@FechaFin DATE,
@Tipo NVARCHAR(50)
AS
BEGIN
UPDATE Suscripciones
SET FechaInicio = @FechaInicio, FechaFin = @FechaFin, Tipo = @Tipo
WHERE SuscripcionID = @SuscripcionID;
END


EXEC sp_EditarSuscripcion 3, '2023-09-23', '2024-09-23', 'Anual'
EXEC sp_EditarSuscripcion 5, '2024-03-23', '2024-04-23', 'Mensual'
EXEC sp_EditarSuscripcion 7, '2024-01-23', '2024-03-23', 'Trimestral'



SELECT * FROM HistoriaVisualizacion;

CREATE PROCEDURE sp_EliminarHistoriaVisualizacion
@HistoriaID INT
AS
BEGIN
DELETE FROM HistoriaVisualizacion
WHERE HistoriaID = @HistoriaID;
END;


EXEC sp_EliminarHistoriaVisualizacion 15
EXEC sp_EliminarHistoriaVisualizacion 17
EXEC sp_EliminarHistoriaVisualizacion 11





Select * from Suscripciones;

CREATE PROCEDURE sp_ConsultarSuscripcion
@Tipo NVARCHAR(50)
AS
BEGIN
SELECT u.UsuarioID, u.Nombre, u.Email, s.FechaInicio, s.FechaFin, s.Tipo
FROM Usuarios u
JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
WHERE s.Tipo = @Tipo;
END;

EXEC sp_ConsultarSuscripcion 'Anual'
EXEC sp_ConsultarSuscripcion 'Mensual'
EXEC sp_ConsultarSuscripcion 'Trimestral'




SELECT * FROM Peliculas;

CREATE PROCEDURE sp_ConsultarPeliculasGenero
@Genero NVARCHAR(50)
AS
BEGIN
SELECT u.Nombre, p.PeliculaID, p.Titulo, p.Genero, hv.FechaVisualizacion
FROM HistoriaVisualizacion hv
JOIN Peliculas p ON hv.PeliculaID = p.PeliculaID
JOIN Usuarios u ON u.UsuarioID = hv.UsuarioID
WHERE p.Genero = @Genero;
END;


EXEC sp_ConsultarPeliculasGenero 'Acción'
EXEC sp_ConsultarPeliculasGenero 'Drama'
EXEC sp_ConsultarPeliculasGenero 'Ciencia Ficción'


















