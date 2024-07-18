CREATE TRIGGER trgCambiosPeliculas
ON DATABASE
FOR ALTER_TABLE
AS
BEGIN
IF EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(128)') = 'Peliculas'
BEGIN
INSERT INTO HistoriaVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion)
VALUES (1, 1, GETDATE());
END
END;

ALTER TABLE Peliculas ADD Duracion INT;
ALTER TABLE Peliculas ADD Director NVARCHAR(100);

SELECT * FROM HistoriaVisualizacion;



---




CREATE TRIGGER trgEliminacionUsuarios
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
IF EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(128)') = 'Usuarios'
BEGIN
RAISERROR ('No se permite eliminar la tabla Usuarios.', 16, 1);
ROLLBACK;
END
END;

DROP TABLE Usuarios;


--



CREATE TRIGGER trgValidarEmail
ON Usuarios
INSTEAD OF INSERT
AS
BEGIN
DECLARE @Email NVARCHAR(100);
SELECT @Email = Email FROM inserted;
IF @Email NOT LIKE '%_@__%.__%'
BEGIN
RAISERROR ('El formato del correo electrónico no es válido.', 16, 1);
ROLLBACK TRANSACTION;
END
ELSE
BEGIN
INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro)
SELECT Nombre, Email, Pass, FechaRegistro FROM inserted;
END
END;


INSERT INTO Usuarios (Nombre, Email, Pass)VALUES ('Juan Pérez', 'juan.perez_correo.com', 'contrasena123');


--

CREATE TRIGGER trgActualizarSuscripcion
ON Usuarios
FOR DELETE
AS
BEGIN
DECLARE @UsuarioID INT;
SELECT @UsuarioID = UsuarioID FROM deleted;
    
UPDATE Suscripciones
SET FechaFin = GETDATE()
WHERE UsuarioID = @UsuarioID AND FechaFin IS NULL;
END;

DELETE FROM Usuarios WHERE UsuarioID = 1006;

SELECT * FROM Suscripciones; 



