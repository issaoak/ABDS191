INSERT INTO Usuarios (Nombre, Apellidos, Telefono, Email, Contraseña)
VALUES 
('Juan', 'Pérez García', '1234567890', 'juan.perez@gmail.com', 'p12392'),
('María', 'López Martínez', '0987654321', 'maria.lopez@outlook.com', 'secieiwe'),
('Carlos', 'Sánchez Hernández', '1122334455', 'carlos.sanchez@gmail.com', 'Car828'),
('Ana', 'Rodríguez Torres', '6677889900', 'ana.rodriguez@gmail.com', 'ana823'),
('Luis', 'Gómez Fernández', '4433221100', 'luis.gomez@outlook.com', 'luis1234');


INSERT INTO Membresias (Nombre, Precio, Beneficios)
VALUES 
('Básica', 29.99, 'Acceso al gimnasio, 1 clase grupal al mes'),
('Premium', 59.99, 'Acceso total, clases grupales ilimitadas, 1 sesión de entrenamiento personal'),
('VIP', 99.99, 'Acceso VIP, clases grupales ilimitadas, entrenamiento personal ilimitado, acceso a la zona VIP'),
('Estudiante', 19.99, 'Acceso al gimnasio, 2 clases grupales al mes'),
('Familiar', 89.99, 'Acceso familiar, clases grupales ilimitadas, 2 sesiones de entrenamiento personal por miembro');

INSERT INTO Usuarios_Membresias (ID_usuario, ID_membresia, Fecha_adquiridad, Fecha_vencimiento)
VALUES 
(1, 2, '2024-01-01', '2025-01-01'),
(2, 1, '2024-02-01', '2025-02-01'),
(3, 3, '2024-03-01', '2025-03-01'),
(4, 4, '2024-04-01', '2025-04-01'),
(5, 5, '2024-05-01', '2025-05-01');

INSERT INTO Perfil_Usuarios (ID_usuario, Edad, Peso, Genero, Tipo_cuerpo)
VALUES 
(1, 25, 70.5, 'Masculino', 'Atlético'),
(2, 30, 65.0, 'Femenino', 'Delgado'),
(3, 35, 80.0, 'Masculino', 'Robusto'),
(4, 28, 55.5, 'Femenino', 'Atlético'),
(5, 40, 90.0, 'Masculino', 'Musculoso');

INSERT INTO Ejercicios (Nombre, Grupo_muscular, Tipo_ejercicio)
VALUES 
('Sentadillas', 'Piernas', 'Fuerza'),
('Press de banca', 'Pecho', 'Fuerza'),
('Curl de bíceps', 'Brazos', 'Fuerza'),
('Dominadas', 'Espalda', 'Fuerza'),
('Planchas', 'Core', 'Resistencia');

INSERT INTO Ejercicios_Personalizados (ID_usuario, ID_ejercicio, Calificación, Detalles_adicionales)
VALUES 
(1, 1, 5, 'Usar barra de 20kg'),
(2, 2, 4, 'Usar mancuernas de 15kg'),
(3, 3, 3, 'Usar banda elástica'),
(4, 4, 5, 'Hacer 10 repeticiones'),
(5, 5, 4, 'Mantener la posición por 1 minuto');

INSERT INTO Alimentos (Nombre, Ingredientes, Calorias, Tiempo_preparacion)
VALUES 
('Ensalada César', 'Lechuga, Pollo, Queso parmesano, Aderezo César', 250, 10),
('Batido de proteínas', 'Leche, Proteína en polvo, Plátano', 300, 5),
('Avena con frutas', 'Avena, Leche, Fresas, Bananas', 200, 15),
('Pasta integral', 'Pasta integral, Tomate, Pollo', 350, 20),
('Sandwich de atún', 'Pan integral, Atún, Lechuga, Tomate', 400, 10);

INSERT INTO Objetivos_Usuario (ID_usuario, Objetivo, Dieta, Ejercicio, Dias, Hora)
VALUES 
(1, 'Perder peso', 'Dieta baja en carbohidratos', 'Cardio y pesas', 5, 1.5),
(2, 'Ganar músculo', 'Alta en proteínas', 'Pesas', 4, 2.0),
(3, 'Mantener peso', 'Balanceada', 'Cardio', 3, 1.0),
(4, 'Mejorar resistencia', 'Alta en carbohidratos', 'Cardio y pesas', 6, 1.0),
(5, 'Tonificar', 'Balanceada', 'Pesas y cardio', 5, 1.5);

INSERT INTO Progreso_Usuario (ID_usuario, Fecha, Peso_actual, Observaciones)
VALUES 
(1, '2024-06-01', 68.0, 'Buena progresión'),
(2, '2024-06-01', 66.0, 'Aumento de masa muscular'),
(3, '2024-06-01', 79.5, 'Manteniendo el peso'),
(4, '2024-06-01', 55.0, 'Mejora en la resistencia'),
(5, '2024-06-01', 89.0, 'Aumento en fuerza');

INSERT INTO Plan_Ejercicio (Nombre, Descripción)
VALUES 
('Plan básico', 'Rutina básica para principiantes'),
('Plan avanzado', 'Rutina para usuarios avanzados'),
('Plan de fuerza', 'Enfocado en ejercicios de fuerza'),
('Plan de resistencia', 'Enfocado en mejorar la resistencia'),
('Plan de tonificación', 'Enfocado en tonificar el cuerpo');

INSERT INTO Detalle_Plan_Ejercicio (ID_plan, ID_ejercicio, Repeticiones, Duración)
VALUES 
(1, 1, 10, 30),
(2, 2, 12, 45),
(3, 3, 15, 20),
(4, 4, 8, 40),
(5, 5, 20, 60);

INSERT INTO Dieta (Nombre, Descripción)
VALUES 
('Dieta baja en carbohidratos', 'Plan de comidas con bajo contenido de carbohidratos'),
('Dieta alta en proteínas', 'Plan de comidas con alto contenido de proteínas'),
('Dieta balanceada', 'Plan de comidas balanceado'),
('Dieta vegana', 'Plan de comidas basado en plantas'),
('Dieta paleo', 'Plan de comidas basado en la dieta de nuestros ancestros');

INSERT INTO Historial_Alimentos (id_usuario, id_alimentos, Fecha, Cantidad)
VALUES 
(1, 1, '2024-06-15', 120.5),
(2, 2, '2024-06-16', 150.0),
(3, 3, '2024-06-17', 130.0),
(4, 4, '2024-06-18', 140.5),
(5, 5, '2024-06-19', 160.0);

INSERT INTO Comentarios_Ejercicios (ID_ejercicio, ID_usuario, Comentario, Fecha)
VALUES 
(1, 1, 'Ejercicio efectivo para las piernas', '2024-06-01'),
(2, 2, 'Me gusta hacer este ejercicio', '2024-06-02'),
(3, 3, 'Buen ejercicio para los brazos', '2024-06-03'),
(4, 4, 'Difícil pero efectivo', '2024-06-04'),
(5, 5, 'Ayuda mucho con la resistencia', '2024-06-05');




CREATE VIEW Vista_Usuarios_Membresias AS
SELECT U.Nombre,  U.Apellidos,  U.Telefono,  U.Email,  M.Nombre AS Membresia,  M.Precio,  M.Beneficios, UM.Fecha_adquiridad,  UM.Fecha_vencimiento
FROM Usuarios U
JOIN Usuarios_Membresias UM ON U.ID_usuario = UM.ID_usuario
JOIN Membresias M ON UM.ID_membresia = M.ID_membresia;
SELECT * FROM Vista_Usuarios_Membresias;


CREATE VIEW Vista_Perfiles_Usuarios AS
SELECT U.Nombre,  U.Apellidos,  PU.Edad,  PU.Peso,  PU.Genero, PU.Tipo_cuerpo
FROM Usuarios U
JOIN Perfil_Usuarios PU ON U.ID_usuario = PU.ID_usuario;
SELECT * FROM Vista_Perfiles_Usuarios;


CREATE VIEW Vista_Ejercicios_Personalizados AS
SELECT U.Nombre,  U.Apellidos,  E.Nombre AS Ejercicio,  E.Grupo_muscular,  E.Tipo_ejercicio,  EP.Calificación,  EP.Detalles_adicionales
FROM Usuarios U
JOIN Ejercicios_Personalizados EP ON U.ID_usuario = EP.ID_usuario
JOIN Ejercicios E ON EP.ID_ejercicio = E.ID_ejercicio;
SELECT * FROM Vista_Ejercicios_Personalizados;


CREATE VIEW Vista_Historial_Alimentos AS
SELECT U.Nombre,  U.Apellidos,  A.Nombre AS Alimento,  A.Ingredientes,  A.Calorias,  HA.Fecha,  HA.Cantidad
FROM Usuarios U
JOIN Historial_Alimentos HA ON U.ID_usuario = HA.ID_usuario
JOIN Alimentos A ON HA.ID_alimentos = A.ID_alimento;
SELECT * FROM Vista_Historial_Alimentos;



CREATE VIEW Vista_Progresos_Usuarios AS
SELECT U.Nombre,  U.Apellidos,  P.Fecha,  P.Peso_actual,  P.Observaciones
FROM Usuarios U
JOIN Progreso_Usuario P ON U.ID_usuario = P.ID_usuario;
SELECT * FROM Vista_Progresos_Usuarios;

