--Procedimientos por default

--Explorar las propiedades de una BD

EXEC sp_helpdb
EXEC sp_helpdb 'PlataformaStreaming'

--Explorar las propiedades de una objeto

EXEC sp_help 'Usuarios'

--Lllaves primarias

EXEC sp_helpindex 'Usuarios'

--informacion de los usuarios y procesos actuales

EXEC sp_who

--rendimiento del servidor

EXEC sp_monitor

--Espacio usado por la BD

EXEC sp_spaceused

-- Puerto de escucha del sql server

EXEC sp_readerrorlog 0.1

--Procedimientos propios

--Procedimiento de visualizacion de historial


CREATE PROCEDURE sp_ObtenerHistorial
@usuarioId INT
AS
BEGIN

SELECT h.HistoriaID, p.Titulo, h.FechaVisualizacion
FROM HistoriaVisualizacion h
JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioId
ORDER BY h.FechaVisualizacion DESC;

END;


EXEC sp_ObtenerHistorial 1;




DROP PROCEDURE [sp_ObtenerHistorial];
GO

-- Insertar pelicula

CREATE PROCEDURE sp_InsertarPelicula
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fechaestreno DATE
AS
BEGIN
 INSERT INTO Peliculas(Titulo, Genero, FechaEstreno) VALUES(@titulo, @genero,@fechaestreno)
 END;


EXEC sp_InsertarPelicula 'Intensamente', 'infantil', '2024-06-12'
SELECT * FROM Peliculas;

DROP PROCEDURE [sp_InsertarPelicula];
GO