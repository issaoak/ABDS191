
--Vistas

CREATE VIEW Vista_Usuario_Planes AS
SELECT u.id_usuario, u.Nombre AS Usuario_Nombre, p.Nombre AS Plan_Nombre,  d.Nombre AS Dieta_Nombre
FROM Usuarios u
JOIN Objetivos_usuario o ON u.id_usuario = o.id_usuario
JOIN Plan_Ejercicio p ON o.id_objetivos = p.id_plan
JOIN Dieta d ON o.id_objetivos = d.id_dieta;

SELECT * FROM Vista_Usuario_Planes;


CREATE VIEW Vista_DetallesEjercicio AS
SELECT e.id_ejercicio, e.Nombre AS NombreEjercicio, c.Comentario, c.Fecha
FROM  Ejercicios e
JOIN  Comentarios_Ejercicios c ON e.id_ejercicio = c.id_ejercicio;

SELECT * FROM Vista_DetallesEjercicio;




CREATE VIEW Vista_UsuarioObjDie AS
SELECT u.id_usuario, u.Nombre AS NombreUsuario, ou.Objetivo, ou.Dieta AS DetallesDieta
FROM Usuarios u
JOIN Objetivos_usuario ou ON u.id_usuario = ou.id_usuario;



SELECT * FROM Vista_UsuarioObjDie;



-- Select data from the view
SELECT * FROM Vista_UsuarioObjetivoDieta;






--PROCEDIMIENTOS
-- 
CREATE PROCEDURE sp_AgregarUsuario
@Nombre NVARCHAR(50),
@Apellidos NVARCHAR(50),
@Telefono NVARCHAR(50),
@Email NVARCHAR(50),
@Contraseña NVARCHAR(50)
AS
BEGIN
INSERT INTO Usuarios (Nombre, Apellidos, Telefono, Email, Contraseña) VALUES(@Nombre, @Apellidos, @Telefono, @Email, @Contraseña);
END;

EXEC sp_AgregarUsuario 'Mauricio', 'Gael', '4421551512', 'Mau@gmail.com', 'bsdhbdvhs'
EXEC sp_AgregarUsuario 'Ruben', 'Gutierrez', '4427671712', 'rurrbe@outlook.es', 'ghadhd'
EXEC sp_AgregarUsuario 'Estafania', 'Ocaña', '4421892872', 'estff@gmail.com', 'gbdggfd'


SELECT * FROM Usuarios;

--
CREATE PROCEDURE sp_ActualizarEjercicio
@id_ejercicio INT,
@Nombre NVARCHAR(50),
@Grupo_muscular NVARCHAR(50),
@Tipo_ejercicio NVARCHAR(MAX)
AS
BEGIN
UPDATE Ejercicios 
SET Nombre = @Nombre, Grupo_muscular = @Grupo_muscular, Tipo_ejercicio = @Tipo_ejercicio
WHERE id_ejercicio = @id_ejercicio;
END;


EXEC sp_ActualizarEjercicio 1,'Flexiones', 'Pecho', 'Resistencia'
EXEC sp_ActualizarEjercicio 3 ,'Abdominales', 'Abdomen', 'Resistencia'
EXEC sp_ActualizarEjercicio 5, 'Remo con mancuernas', 'Espalda', 'Fuerza'

SELECT * FROM Ejercicios;



--

CREATE PROCEDURE sp_AgregarAlimento
@Nombre NVARCHAR(50),
@Ingredientes NVARCHAR(50),
@Calorias INT,
@Tiempopreparacion INT
AS
BEGIN
INSERT INTO Alimentos (Nombre, Ingredientes, Calorias, Tiempo_preparacion)
VALUES (@Nombre, @Ingredientes, @Calorias, @Tiempopreparacion);
END;

EXEC sp_AgregarAlimento 'Tacos de pollo', 'Pollo, Tortillas, Salsa', '400', '20'
EXEC sp_AgregarAlimento 'Pasta Carbonara', 'Pasta, Huevo, Tocino, Queso', '600', '25'
EXEC sp_AgregarAlimento 'Smoothie Verde', 'Espinacas, Manzana, Pepino', '150', '10'


SELECT * FROM Alimentos;



--
CREATE PROCEDURE sp_PlanEjer
@id_plan INT
AS
BEGIN
SELECT * FROM Plan_Ejercicio 
WHERE id_plan = @id_plan;
END;

EXEC sp_PlanEjer 5
EXEC sp_PlanEjer 4
EXEC sp_PlanEjer 3

SELECT * FROM Plan_Ejercicio;

--

CREATE PROCEDURE sp_Actualizardieta
@id_dieta INT,
@Nombre NVARCHAR(50),
@Descripcion NVARCHAR(max)
AS
BEGIN
UPDATE Dieta
SET Nombre =@Nombre, Descripción= @Descripcion
WHERE id_dieta = @id_dieta
END;



EXEC sp_ActualizarDieta 2, 'Dieta Mediterránea', 'Se caracteriza por un alto consumo de frutas, verduras, legumbres, frutos secos.'
EXEC sp_ActualizarDieta 3, 'Dieta DASH', 'Se enfoca en reducir la ingesta de sodio y aumentar el consumo de alimentos ricos en nutrientes que ayudan a reducir la presión arterial, como potasio, calcio y magnesio.'
EXEC sp_ActualizarDieta 5, 'Dieta Keto', 'Dieta baja en carbohidratos y alta en grasas.'


SELECT * FROM Dieta;

--Procedimiento con transacciones

CREATE PROCEDURE sp_AgregarUsuPer
@Nombre NVARCHAR(50),
@Apellidos NVARCHAR(50),
@Telefono NVARCHAR(50),
@Email NVARCHAR(50),
@Contraseña NVARCHAR(50),
@Edad INT,
@Peso DECIMAL(5, 2),
@Genero NVARCHAR(50),
@Tipo_cuerpo NVARCHAR(50)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO Usuarios (Nombre, Apellidos, Telefono, Email, Contraseña) VALUES (@Nombre, @Apellidos, @Telefono, @Email, @Contraseña);
INSERT INTO Perfil_Usuarios (id_usuario, Edad, Peso, Genero, Tipo_cuerpo) VALUES (SCOPE_IDENTITY(), @Edad, @Peso, @Genero, @Tipo_cuerpo);
COMMIT TRANSACTION;
END;

EXEC sp_AgregarUsuPer 'Juan', 'Perez', '5125325231', 'juanit@gamil.com', 'bvdbbbjc', '30', '110', 'Hombre', 'Robusto'
EXEC sp_AgregarUsuPer 'Cralos', 'Govea', '766321621', 'carlis@gmail.com', 'b1681ca', '24', '80', 'Hombre', 'Delgado'
EXEC sp_AgregarUsuPer 'Brayan', 'Hernandez', '6126216761', 'brara@outlook.es', 'bayyaan', '22', '21', 'Hombre', 'Atletico'


SELECT * FROM Usuarios;
SELECT * FROM Perfil_Usuarios;
--



--


CREATE PROCEDURE sp_ProcesarUsuariosYMembresias
@NombreUsuario NVARCHAR(50),
@ApellidosUsuario NVARCHAR(50),
@Telefono NVARCHAR(50),
@Email NVARCHAR(50),
@Contraseña NVARCHAR(50),
@NombreMembresia NVARCHAR(50),
@PrecioMembresia DECIMAL(10, 2),
@BeneficiosMembresia NVARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO Usuarios (Nombre, Apellidos, Telefono, Email, Contraseña) VALUES (@NombreUsuario, @ApellidosUsuario, @Telefono, @Email, @Contraseña);
INSERT INTO Membresias (Nombre, Precio, Beneficios) VALUES (@NombreMembresia, @PrecioMembresia, @BeneficiosMembresia);
COMMIT TRANSACTION;
END;


EXEC sp_ProcesarUsuariosYMembresias 'Juan', 'Pérez', '555-1234', 'juan.perez@example.com', 'password123', 'Gold', '999.99', 'Acceso ilimitado a todas las instalaciones'
EXEC sp_ProcesarUsuariosYMembresias 'María', 'García', '555-5678', 'maria.garcia@example.com', 'mariapass', 'Silver', '499.99','Acceso a gimnasio y piscina'
EXEC sp_ProcesarUsuariosYMembresias 'Carlos', 'Sánchez', '555-9876', 'carlos.sanchez@example.com', 'carlospass', 'Bronze', '199.99', 'Acceso al gimnasio'

SELECT * FROM Usuarios;
SELECT * FROM Membresias;