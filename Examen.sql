CREATE TABLE Clientes(
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);

CREATE TABLE Cuentas (
    CuentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    TipoCuenta NVARCHAR(50),
    FechaApertura DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    CuentaID INT,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Posicion NVARCHAR(50),
    Departamento NVARCHAR(50),
    FechaContratacion DATE
);



CREATE PROCEDURE sp_AgregarEmpleado
@Nombre NVARCHAR(100),
@Posicion NVARCHAR(50),
@Departamento NVARCHAR(50),
@Fecha_Contratacion DATE
AS
BEGIN
INSERT INTO Empleados(Nombre, Posicion, Departamento, FechaContratacion) VALUES (@Nombre, @Posicion, @Departamento, @Fecha_Contratacion)
END;
EXEC sp_AgregarEmpleado 'Isidro Martinez ', 'Gerente', 'General', '2024-07-10'
EXEC sp_AgregarEmpleado 'Emilio Martinez', 'Representante', 'Ventas', '2023-03-12'

SELECT * FROM Empleados;







CREATE PROCEDURE sp_AgregarCliente
@Nombre NVARCHAR(100),
@Direccion NVARCHAR(200),
@Telefono NVARCHAR(15),
@Email NVARCHAR(100)
AS
BEGIN
INSERT INTO Clientes(Nombre, Direccion, Telefono, Email) VALUES(@Nombre, @Direccion, @Telefono,@Email)
END;
EXEC sp_AgregarCliente 'Monica', 'Carlos Esquerro #37', '4423636118', 'Moni80@hotmail.com'
SELECT * FROM Clientes;


CREATE PROCEDURE sp_NuevaCuenta
@IdCliente INT,
@Tipo_Cuenta NVARCHAR(50),
@Fecha_Apertura DATE,
@Tipo_Transaccion NVARCHAR(50),
@Monto DECIMAL(18,2),
@Fecha_Transaccion DATETIME
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO Cuentas (ClienteID, TipoCuenta, FechaApertura) VALUES (@IdCliente, @Tipo_Cuenta, @Fecha_Apertura)
INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion) VALUES (SCOPE_IDENTITY(), @Tipo_Transaccion, @Monto, @Fecha_Transaccion)
COMMIT TRANSACTION;
END;


EXEC sp_NuevaCuenta 1 , 'Ahorros', '2024-07-09','Deposito inicial', 1500.00, '2024-07-10'

SELECT * FROM Cuentas;
SELECT * FROM Transacciones;

