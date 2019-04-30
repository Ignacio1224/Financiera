/* Definicion de Procedimientos Almacenados */

USE OBLBD2;
GO

CREATE PROCEDURE ResetIdentityCliente
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXC INT;
    SELECT @MAXC = ISNULL(MAX(IdCliente), 0)
    FROM Cliente;
    DBCC CHECKIDENT (Cliente, RESEED, @MAXC);
END
GO

CREATE PROCEDURE ResetIdentityCuenta
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXCU INT;
    SELECT @MAXCU = ISNULL(MAX(IdCuenta), 0)
    FROM Cuenta;
    DBCC CHECKIDENT (Cuenta, RESEED, @MAXCU);
END
GO

CREATE PROCEDURE ResetIdentityMovimiento
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXM INT;
    SELECT @MAXM = ISNULL(MAX(IdMovim), 0)
    FROM Movimiento;
    DBCC CHECKIDENT (Movimiento, RESEED, @MAXM);
END
GO

CREATE PROCEDURE ResetIdentityTransferencia
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXT INT;
    SELECT @MAXT = ISNULL(MAX(IdTransfer), 0)
    FROM Transferencia;
    DBCC CHECKIDENT (Transferencia, RESEED, @MAXT);
END
GO

