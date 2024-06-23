CREATE VIEW VistaGlobal AS
SELECT u.UsuarioID, u.Nombre AS NombreUsuario, u.Email, p.PeliculaID, p.Titulo AS TituloPelicula, p.Genero AS GeneroPelicula, p.FechaEstreno, s.SuscripcionID, s.FechaInicio AS FechaInicioSuscripcion, s.FechaFin AS FechaFinSuscripcion, s.Tipo AS TipoSuscripcion, hv.HistoriaID, hv.FechaVisualizacion
FROM Usuarios u
JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
JOIN HistoriaVisualizacion hv ON u.UsuarioID = hv.UsuarioID
JOIN Peliculas p ON hv.PeliculaID = p.PeliculaID;

SELECT * FROM VistaGlobal;