CREATE PROCEDURE sp_InsetarSuscripciones
@Id_usuario INT,
@Tipo NVARCHAR(50),
@Fecha_inicio DATE,
@Fecha_fin DATE
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Suscripciones(UsuarioID, Tipo, FechaInicio, FechaFin) VALUES (@Id_usuario, @Tipo, @Fecha_inicio, @Fecha_fin)
UPDATE Usuarios
SET FechaRegistro = @Fecha_inicio
WHERE UsuarioID = @Id_usuario;
COMMIT TRANSACTION;
END;



SELECT * FROM Usuarios;
SELECT * FROM Suscripciones;

EXEC sp_InsetarSuscripciones 1, 'Mensual','2024-07-12', '2024-08-12' 



