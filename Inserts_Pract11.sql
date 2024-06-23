CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Pass NVARCHAR(100) NOT NULL,
    FechaRegistro DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Peliculas(
    PeliculaID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(100) NOT NULL,
    Genero NVARCHAR(50),
    FechaEstreno DATE
);

CREATE TABLE Suscripciones (
    SuscripcionID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    Tipo NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE HistoriaVisualizacion (
    HistoriaID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NOT NULL,
    PeliculaID INT NOT NULL,
    FechaVisualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID)
);







INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES
('Isidro', 'isi292@gmail.com', 'isssb28', '2023-12-24'),
('Emilio', 'emil292@gmail.com', 'elimb28', '2023-11-24'),
('Ruben', 'Rusc0292@gmail.com', 'rucsssb28', '2023-07-14'),
('Alejandro', 'alexi292@gmail.com', 'ellassb28', '2024-02-17'),
('Santiago', 'santi292@gmail.com', 'sanssb28', '2023-10-18'),
('Samuel', 'samii292@gmail.com', 'sammssb28', '2023-12-11'),
('Perla', 'perl292@gmail.com', 'perssb28', '2023-09-04'),
('Mateo', 'matt292@gmail.com', 'matasb28', '2024-02-12'),
('Monse', 'monse292@gmail.com', 'monssb28', '2024-03-08'),
('Zaira', 'zaira292@gmail.com', 'zazrssb28', '2024-01-27');

INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) VALUES
('Sueño de fuga', 'Drama', '1994-09-22'),
('El Padrino', 'Crimen', '1972-03-24'),
('El Caballero Oscuro', 'Acción', '2008-07-18'),
('Tiempos Violentos', 'Crimen', '1994-10-14'),
('El Señor de los Anillos: El Retorno del Rey', 'Fantasía', '2003-12-17'),
('Forrest Gump', 'Drama', '1994-07-06'),
('El Origen', 'Ciencia Ficción', '2010-07-16'),
('El Club de la Pelea', 'Drama', '1999-10-15'),
('Matrix', 'Ciencia Ficción', '1999-03-31'),
('Buenos Muchachos', 'Crimen', '1990-09-19'),
('El Imperio Contraataca', 'Ciencia Ficción', '1980-05-21');

INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
(1, '2024-01-01', '2024-12-31', 'Anual'),
(2, '2024-02-01', '2024-11-30', 'Mensual'),
(3, '2024-03-01', NULL, NULL),
(4, '2024-04-01', '2024-07-01', 'Trimestral'),
(5, '2024-05-01', '2024-05-31', 'Mensual'),
(6, '2024-06-01', NULL, NULL),
(7, '2024-07-01', '2025-06-30', 'Anual');

INSERT INTO HistoriaVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-20'),
(3, 3, '2023-03-25'),
(4, 4, '2023-04-30'),
(5, 5, '2023-05-05'),
(6, 6, '2023-06-10'),
(7, 7, '2023-07-15'),
(8, 8, '2023-08-20'),
(9, 9, '2023-09-25'),
(10, 10, '2023-10-30'),
(1, 11, '2023-11-05'),
(2, 1, '2023-12-10'),
(3, 2, '2024-01-15'),
(4, 3, '2024-02-20'),
(5, 4, '2024-03-25'),
(6, 5, '2024-04-30'),
(7, 6, '2024-05-05'),
(8, 7, '2024-06-10'),
(9, 8, '2024-07-15'),
(10, 9, '2024-08-20');




SELECT * FROM Usuarios;
