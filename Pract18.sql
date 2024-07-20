CREATE TRIGGER trgNuevaTabla
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
PRINT 'Se ha creado una nueva tabla en DBBANK.'
END;





CREATE TABLE Prestamos (
    PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    Monto DECIMAL(18,2),
    TasaInteres DECIMAL(5,2),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);



CREATE TABLE PagosPrestamos (
    PagoID INT IDENTITY(1,1) PRIMARY KEY,
    PrestamoID INT,
    MontoPagado DECIMAL(18,2),
    FechaPago DATE,
    FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);

SELECT * FROM Clientes;




CREATE TRIGGER trgNuevoProcedimiento
ON DATABASE
FOR CREATE_PROCEDURE
AS
BEGIN
PRINT 'Se ha creado un Nuevo Procedimiento en DBBANK.'
END;




CREATE PROCEDURE sp_InsertarClientes
@Nombre NVARCHAR(100),
@Direccion NVARCHAR(200),
@Telefono NVARCHAR(15),
@Email NVARCHAR(100)
AS
BEGIN
INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES(@Nombre, @Direccion, @Telefono, @Email)
END;

EXEC sp_InsertarClientes  'Minerva Castillo', 'Carlos Esquerro #38', '4422221578', 'Minita@outlook.es';
EXEC sp_InsertarClientes 'Alejandro Escobedo', 'Carlos Esquerro #38', '4422221778', 'Alexxe@outlook.es';
EXEC sp_InsertarClientes 'Monse Martinez', 'Teresitas #33', '4427163562', 'Monsss@outlook.es';

SELECT * FROM Clientes;

CREATE PROCEDURE sp_InsertarPrestamo
@ClienteID INT,
@Monto DECIMAL(18,2),
@TasaInteres DECIMAL(5,2),
@FechaInicio DATE,
@FechaFin DATE
AS
BEGIN
INSERT INTO  Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES(@ClienteID, @Monto,@TasaInteres, @FechaInicio, @FechaFin)
END;

EXEC sp_InsertarPrestamo 2, '25000.00' , '3.9', '2024-05-20', '2025-05-20'
EXEC sp_InsertarPrestamo 3, '35000.00' , '4.3', '2024-04-16', '2025-07-16'
EXEC sp_InsertarPrestamo 4, '450000.00' , '2.9', '2024-02-18', '2025-12-18'

SELECT * FROM Prestamos;

CREATE PROCEDURE sp_InsertarPagoP
@PrestamoId INT,
@MontoPagado DECIMAL(18,2),
@FechaPago DATE
AS
BEGIN
INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago) VALUES (@PrestamoId, @MontoPagado, @FechaPago)
END;

EXEC sp_InsertarPagoP 1, '15000.00', '2024-11-20'
EXEC sp_InsertarPagoP 2, '13500.00', '2024-09-16'
EXEC sp_InsertarPagoP 3, '150000.00', '2024-10-18'

SELECT * FROM PagosPrestamos;
SELECT * FROM Prestamos;
SELECT * FROM Clientes;




CREATE PROCEDURE sp_PrestamoConPago
@ClienteID INT,
@Monto DECIMAL(18, 2),
@TasaInteres DECIMAL(5, 2),
@FechaInicio DATE,
@FechaFin DATE,
@MontoPagoInicial DECIMAL(18, 2),
@FechaPagoInicial DATE
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES (@ClienteID, @Monto, @TasaInteres, @FechaInicio, @FechaFin)
DECLARE @PrestamoID INT = SCOPE_IDENTITY();
INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago) VALUES (@PrestamoID, @MontoPagoInicial, @FechaPagoInicial)
COMMIT TRANSACTION;
END;



SELECT * FROM Clientes;

EXEC sp_PrestamoConPago 2, '155000.00', '2.9', '2024-08-10', '2026-08-10', '5500.00', '2024-09-10'
EXEC sp_PrestamoConPago 3, '1800000.00', '4.3', '2024-01-08', '2026-01-08', '110000.00', '2024-02-10'
EXEC sp_PrestamoConPago 4, '77000.00', '1.9', '2024-07-19', '2024-12-19', '20000.00', '2024-08-19'

SELECT * FROM Prestamos;
SELECT * FROM PagosPrestamos;






CREATE PROCEDURE sp_ConsultarCPP
AS
BEGIN
SELECT c.ClienteID, c.Nombre, c.Direccion, c.Telefono, c.Email, p.PrestamoID, p.Monto AS MontoPrestamo, p.TasaInteres, p.FechaInicio, p.FechaFin, pp.PagoID, pp.MontoPagado, pp.FechaPago
FROM Clientes c
LEFT JOIN Prestamos p ON c.ClienteID = p.ClienteID
LEFT JOIN PagosPrestamos pp ON p.PrestamoID = pp.PrestamoID;
END;

EXEC sp_ConsultarCPP