--Declarar variable
DECLARE @idCliente INT
    --Inicializar o asignar valor
    --SET @idCliente = 8
    --if
    --IF @idCliente = 8
    --SELECT * FROM Clientes WHERE id_cliente = @idCliente



    DECLARE @edad INT
    SET @idCliente = 9

    IF @idCliente = 8
    BEGIN
    SET @edad = 25
    SELECT * FROM Clientes WHERE id_cliente = @idCliente
    PRINT @edad
END
ELSE
 BEGIN
    PRINT 'ERROR: '
    PRINT 'Id no autorizado para la consulta'
 END





--Declarar variable
DECLARE @idCliente INT
    --Inicializar o asignar valor
    --SET @idCliente = 8
    --if
    --IF @idCliente = 8
    --SELECT * FROM Clientes WHERE id_cliente = @idCliente



    DECLARE @edad INT
    SET @idCliente = 9

    IF @idCliente = 8
    BEGIN
    SET @edad = 25
    SELECT * FROM Clientes WHERE id_cliente = @idCliente
    PRINT @edad
    IF EXISTS (SELECT * FROM Clientes WHERE id_cliente = 10)
    PRINT 'Si existe'
END
ELSE
 BEGIN
    PRINT 'ERROR: '
    PRINT 'Id no autorizado para la consulta'
 END



--WHILE

DECLARE @contador INT = 0 

WHILE @contador  <= 10
BEGIN
    PRINT @contador
    SET @contador = @contador +1 
END

--RETURN

DECLARE @contador INT = 0 

WHILE @contador  <= 10
BEGIN
    PRINT @contador
    SET @contador = @contador +1
    IF @contador = 3
    RETURN
    PRINT('HOLA')
END
PRINT('aqui continua al flujo')

DECLARE @contador INT = 0 

WHILE @contador  <= 10
BEGIN
    PRINT @contador
    SET @contador = @contador +1
    IF @contador = 3
    BREAK
    PRINT('HOLA')
END
PRINT('aqui continua al flujo')
BEGIN TRY
SET @contador = 'isi'
END TRY
BEGIN CATCH
PRINT('La variable contador solo acepta enteros: ')
END CATCH

PRINT('otra consulta')
PRINT('yo tambien')


