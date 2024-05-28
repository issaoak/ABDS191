USE ComicStore;

INSERT INTO Clientes (nombre, correo_electronico, pass) VALUES
('Ruben', 'ruben21@gmail.com', '123456'),
('Monica', 'moni01@hotmail.com', 'moni80'),
('Emilio', 'emil19@gmail.com', '140222'),
('Santiago', 'santi@outlook.es', 'as1212'),
('Noe', 'Arca28@gmail.com', '1873836'),
('Paola', 'paoo39@gmail.com', 'aos1928'),
('Alejando', 'alex76@hotmail.com', 'Homa28'),
('Jesus', 'jessss@gmail.com', 'Jmm8267'),
('Minerva', 'Minnn82@otlook.es', '827moaa'),
('Guadalupe', 'Gguapp@gmail.com', 'gsa98282'),
('Samuel', 'samhu23@outlook.com', 'hgshb22'),
('Mateo', 'mamss27@gmail.com', 'mndgdns');

INSERT INTO Comics (nombre, anio, precio) VALUES
('Batman: El Caballero Oscuro Regresa', '86', '410.00'),
('X-Men: Días del Futuro Pasado', '81', '375.00'),
('Watchmen', '86', '519.80'),
('Maus', '86', '290.00'),
('Sandman: Preludios y Nocturnos', '89', '325.00'),
('V de Vendetta', '82', '395.00'),
('Saga de Fénix Oscura', '80', '350.00'),
('Wonder Woman: Dioses y Mortales', '87', '379.80'),
('Superman: El Hombre de Acero', '92', '450.00'),
('Hellboy: Semilla de Destrucción', '94', '299.00'),
('Spawn: El Engendro', '92', '399.00'),
('Los Cuatro Fantásticos', '98', '359.80'),
('Invasión Secreta', '99', '385.00'),
('Akira', '82', '429.00'),
('Ghost in the Shell', '89', '499.80');

SELECT * FROM Clientes;
SELECT * FROM Comics;
SELECT * FROM Inventario;
ALTER TABLE Inventario
ALTER COLUMN disponibilidad BIT;

INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
('16', '3', '1'),
('18', '4', '1'),
('20', '1', '1'),
('22', '0', '0'),
('24', '3', '1'),
('26', '1', '0'),
('28', '3', '1'),
('30', '0', '0'),
('32', '2', '1'),
('34', '6', '1'),
('36', '3', '1'),
('38', '2', '1'),
('40', '1', '1'),
('42', '2', '1'),
('44', '1', '1');


INSERT Into Compras (id_cliente, fecha_compra, total) VALUES
('1','2023-03-11','410.00'),
('3', '2024-05-03', '375.00'),
('6', '2024-01-15', '350.00'),
('8', '2024-03-05', '359.00'),
('10', '2023-11-21', '429.00'),
('11', '2024-04-23', '299.00'),
('12', '2024-02-23', '325.00');

SELECT * FROM Compras;
SELECT * FROM Inventario;
INSERT Into Compras (id_cliente, fecha_compra, total) VALUES
('2', '2023-12-20','410'),
('4', '2023-11-27','375'),
('7', '2024-01-10','410'),
('2', '2024-01-20','375'),
('4', '2024-01-27','325'),
('7', '2024-01-20','375'),
('2', '2024-02-20','519'),
('4', '2024-02-27','450'),
('7', '2024-02-10','499.80');

INSERT INTO Comic_Compras (cantidad, id_compra, id_comic) VALUES
('1', '100', '16'),
('1', '103', '18'),
('1', '106', '28'),
('1', '109', '38'),
('1', '112', '42'),
('1', '115', '34'),
('1', '118', '24'),
('1', '121', '16'),
('1', '124', '18'),
('1', '127', '16'),
('1', '130', '18'),
('1', '133', '24'),
('1', '136', '18'),
('1', '139', '20'),
('1', '142', '32'),
('1', '145', '44');
