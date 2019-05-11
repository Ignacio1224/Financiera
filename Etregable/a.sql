/* Creo la Base de Datos*/

CREATE DATABASE OBLBD2;
GO

USE OBLBD2;
GO
/* Creo las tablas */

CREATE TABLE Sucursal
(
    IdSucursal CHARACTER (5) NOT NULL,
    DscSucursal VARCHAR (20),
    DirSucursal VARCHAR (25),
    MailSucursal VARCHAR (30),
    TelSucursal VARCHAR (30)
);
GO

CREATE TABLE TipoCuenta
(
    IdTipo CHARACTER (3) NOT NULL,
    DscTipo VARCHAR (20)
);
GO

CREATE TABLE Moneda
(
    IdMoneda NUMERIC (6) NOT NULL,
    DscMoneda VARCHAR (30) NOT NULL,
    SimboloMoneda CHAR (5)
);
GO

CREATE TABLE Cliente
(
    IdCliente NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    NombreCliente VARCHAR (30),
    TipoCliente CHARACTER (1),
    TelCliente VARCHAR (30),
    MailCliente VARCHAR (30)
);
GO

CREATE TABLE Cuenta
(
    IdCuenta NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    IdTipo CHARACTER (3),
    IdMoneda NUMERIC (6),
    IdSucursal CHARACTER (5)
);
GO

CREATE TABLE Movimiento
(
    IdMovim NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    FchMovim DATETIME,
    TipoMovim CHARACTER (1),
    IdCuenta NUMERIC (5),
    ImporteMovim MONEY
);
GO

CREATE TABLE Transferencia
(
    IdTransfer NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    FchTransfer DATETIME,
    IdMovim NUMERIC (5),
    TipoTransfer CHARACTER (1),
    CtaDestino NUMERIC (5),
    BancoDestino VARCHAR (30),
    StatusTransfer VARCHAR (10)
);
GO

/* Definición de Indices */

USE OBLBD2;
GO

/* Tabla Cuenta */
-- IdSucursal
CREATE INDEX index_IdSucursal_Cuenta ON Cuenta (IdSucursal);
CREATE INDEX index_IdCliente_Cuenta ON Cuenta (IdCliente);


/* Tabla Movimiento */
-- IdCuenta
CREATE INDEX index_IdCuenta_Movimiento ON Movimiento (IdCuenta);

/* Definicion de Procedimientos Almacenados */

USE OBLBD2;
GO

CREATE TRIGGER ResetIdentityCliente
    ON Cliente
    AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXC INT;
    SELECT @MAXC = ISNULL(MAX(IdCliente), 0)
    FROM Cliente;
    DBCC CHECKIDENT (Cliente, RESEED, @MAXC);
END
GO

CREATE TRIGGER ResetIdentityCuenta
    ON Cuenta
    AFTER INSERT, DELETE, UPDATE

AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXCU INT;
    SELECT @MAXCU = ISNULL(MAX(IdCuenta), 0)
    FROM Cuenta;
    DBCC CHECKIDENT (Cuenta, RESEED, @MAXCU);
END
GO

CREATE TRIGGER ResetIdentityMovimiento
    ON Movimiento
    AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXM INT;
    SELECT @MAXM = ISNULL(MAX(IdMovim), 0)
    FROM Movimiento;
    DBCC CHECKIDENT (Movimiento, RESEED, @MAXM);
END
GO


CREATE TRIGGER ResetIdentityTransferencia
    ON Transferencia
    AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MAXT INT;
    SELECT @MAXT = ISNULL(MAX(IdTransfer), 0)
    FROM Transferencia;
    DBCC CHECKIDENT (Transferencia, RESEED, @MAXT);
END
GO

/*
* Fuente: https://gist.github.com/voskobovich/43f851859c23a8261514
* Fue adaptada para poder insertar sus datos en la tabla correspondiente.
*/

USE OBLBD2;
GO

INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('1', 'Leke', 'Lek');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('2', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('3', 'Afghanis', '؋');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('4', 'Pesos', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('5', 'Guilders', 'ƒ');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('6', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('7', 'New Manats', 'ман');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('8', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('9', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('10', 'Rubles', 'p.');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('11', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('12', 'Dollars', 'BZ$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('13', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('14', 'Bolivianos', '$b');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('15', 'Convertible Marka', 'KM');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('16', 'Pula', 'P');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('17', 'Leva', 'лв');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('18', 'Reais', 'R$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('19', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('20', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('21', 'Riels', '៛');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('22', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('23', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('24', 'Pesos', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('25', 'Yuan Renminbi', '¥');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('26', 'Pesos', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('27', 'Colón', '₡');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('28', 'Kuna', 'kn');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('29', 'Pesos', '₱');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('30', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('31', 'Koruny', 'Kč');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('32', 'Kroner', 'kr');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('33', 'Pesos', 'RD$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('34', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('35', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('36', 'Colones', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('37', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('38', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('39', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('40', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('41', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('42', 'Cedis', '¢');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('43', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('44', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('45', 'Quetzales', 'Q');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('46', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('47', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('48', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('49', 'Lempiras', 'L');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('50', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('51', 'Forint', 'Ft');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('52', 'Kronur', 'kr');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('53', 'Rupees', 'Rp');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('54', 'Rupiahs', 'Rp');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('55', 'Rials', '﷼');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('56', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('57', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('58', 'New Shekels', '₪');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('59', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('60', 'Dollars', 'J$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('61', 'Yen', '¥');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('62', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('63', 'Tenge', 'лв');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('64', 'Won', '₩');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('65', 'Won', '₩');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('66', 'Soms', 'лв');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('67', 'Kips', '₭');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('68', 'Lati', 'Ls');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('69', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('70', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('71', 'Switzerland Francs', 'CHF');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('72', 'Litai', 'Lt');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('73', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('74', 'Denars', 'ден');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('75', 'Ringgits', 'RM');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('76', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('77', 'Rupees', '₨');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('78', 'Pesos', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('79', 'Tugriks', '₮');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('80', 'Meticais', 'MT');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('81', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('82', 'Rupees', '₨');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('83', 'Guilders', 'ƒ');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('84', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('85', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('86', 'Cordobas', 'C$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('87', 'Nairas', '₦');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('88', 'Won', '₩');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('89', 'Krone', 'kr');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('90', 'Rials', '﷼');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('91', 'Rupees', '₨');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('92', 'Balboa', 'B/.');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('93', 'Guarani', 'Gs');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('94', 'Nuevos Soles', 'S/.');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('95', 'Pesos', 'Php');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('96', 'Zlotych', 'zł');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('97', 'Rials', '﷼');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('98', 'New Lei', 'lei');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('99', 'Rubles', 'руб');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('100', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('101', 'Riyals', '﷼');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('102', 'Dinars', 'Дин.');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('103', 'Rupees', '₨');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('104', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('105', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('106', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('107', 'Shillings', 'S');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('108', 'Rand', 'R');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('109', 'Won', '₩');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('110', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('111', 'Rupees', '₨');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('112', 'Kronor', 'kr');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('113', 'Francs', 'CHF');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('114', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('115', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('116', 'New Dollars', 'NT$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('117', 'Baht', '฿');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('118', 'Dollars', 'TT$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('119', 'Lira', 'TL');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('120', 'Liras', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('121', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('122', 'Hryvnia', '₴');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('123', 'Pounds', '£');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('124', 'Dollars', '$');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('125', 'Pesos', '$U');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('126', 'Sums', 'лв');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('127', 'Euro', '€');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('128', 'Bolivares Fuertes', 'Bs');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('129', 'Dong', '₫');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('130', 'Rials', '﷼');
INSERT INTO Moneda
    (IdMoneda, DscMoneda, SimboloMoneda)
VALUES
    ('131', 'Zimbabwe Dollars', 'Z$');

/* Datos de Prueba */

USE OBLBD2;
GO


/* Tabla Sucursal */
INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('6454651532', 'Carrasco', 'Shroeder 2621', NULL, '789789');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    (NULL, 'Carrasco', 'Shroeder 2621', 'aaa@bb.com', '789789');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('1', 'Carrasco', 'Shroeder 2621', 'aa@bb.com', '789789454545665113232132135151531320354');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('1', 'Carrascooooooooooooooooooooooooooooooooooooooooooo', 'Shroeder 2621', 'sdcsd@sdc.com', '789789');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('/*6454651532', 'Carrasco', 'Shroeder 2621', 'AAAAAAaaaaaaaaaaaaa@sdvsdvvvvvdvdsv.com', '789789');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    (1, 'Carrasco', 'Shroeder 2621', 'bcarrasco@gmail.com', '789789');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('1', 'Sayago', 'Millan 5486', 'bmillan@gmail.com', '87932189461');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('2', 'Sayago', 'Millan 5486', 'bmillan@gmail.com', '87932189461');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('2', 'Sayago', 'Millan 5486', 'bmillan@gmail.com', '87932189461');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('3', 'Cordon', '18 de Julio 2222', 'bcordon@gmail.com', '25698743');

INSERT INTO Sucursal
    (IdSucursal, DscSucursal, DirSucursal, MailSucursal, TelSucursal)
VALUES
    ('4', 'Malvin', 'Av. Legrand 1224', 'bmalvin@gmail.com', '26017596');

/* Se prueban los limites de valores de cada campo, la integridad de PK y los campos que no pueden ser nulos  */


/* Tabla TipoCuenta */
INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('ASCS', 'Caja de Ahorro');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    (NULL, 'Caja de Ahorro');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('CA', 'Caja de Ahorro       a');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('CA', 'Caja de Ahorro');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('CA', 'Cuenta Corriente');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('CC', 'Cuenta Corriente');

INSERT INTO TipoCuenta
    (IdTipo, DscTipo)
VALUES
    ('PF', 'Plazo Fijo');

/* Se prueba integridad de PK y limites de valores de datos en los campos */


/* Tabla Cliente */
INSERT INTO Cliente
    (IdCliente, NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('1', 'Martin SA', 'E', '456465465', 'asc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Martin SA', 'Comun', '456465465', 'asc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Martin SA', 'E', '454545454456465465454545454456465465', 'asc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Martin SA', 'E', '454545454456465', 'asdasdasdasdasdasdadfgtdggbasc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Martin SA', 'F', '454545454456465', 'sdadfgtdggbasc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Martin SA', 'E', '454545454456465', 'sdadfgtdggbasc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Pepe', 'P', '4545465', 'sdadfgtdggbasc@as');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Pepe', 'P', '4563518', 'sdcs@adsfs');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Pepegriyo', 'P', '74165', 'sd45cs@adsdfs');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Pepegriyo', 'P', '74165', NULL);

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Ignacio', 'P', '092041', 'icabrera@psico.edu.uy');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Salida', 'P', '092041', 'salida@salida.com');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('Transferencia', 'E', '1236548965', 'transfer@salida.com');

INSERT INTO Cliente
    (NombreCliente, TipoCliente, TelCliente, MailCliente)
VALUES
    ('SALIDA ENTRADA != anio', 'E', '1236548965', 'salida@entrada.com');

/* Se prueba integridad de PK, limites de valores de datos en los campos y campos unique */


/* Tabla Cuenta */
INSERT INTO Cuenta
    (IdCuenta, IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('5641531', '1', '2', '4', '1');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('1', '46516334', '4', '2');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('1', '2', '132', '2');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('1', '2', '4', '2');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('1', '132', '4', '3');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '12', '2', '4');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('3', '124', '3', '4');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '24', '2', '2');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '18', '2', '2');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '18', '2', '6');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '18', '2', '7');

INSERT INTO Cuenta
    (IdTipo, IdMoneda, IdSucursal, IdCliente)
VALUES
    ('2', '24', '4', '8');
/* Se prueba limites de valores de datos en los campos y existencia de las FK */


/* Tabla Movimiento */
INSERT INTO Movimiento
    (IdMovim, FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    ('1', GETDATE(), '2', '1', '456');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    ('2019-14-11', 'E', '1', '456');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    ('2019-04-33', 'E', '1', '456');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'E', '189465', '456352');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), '264513', '1', '456352');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'F', '1', '456352');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'E', '2', '120000');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'S', '1', '1204');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'T', '1', '146');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -1 , 'S', '1', '1634');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -2 , 'S', '1', '1246');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -20 , 'E', '1', '1406');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -1 , 'S', '2', '1634');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -2 , 'S', '3', '1246');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() -20 , 'E', '2', '1406');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'S', '7', '122418');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'T', '8', '122418');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE() - 12, 'E', '9', '125418');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'S', '9', '4865');

INSERT INTO Movimiento
    (FchMovim, TipoMovim, IdCuenta, ImporteMovim)
VALUES
    (GETDATE(), 'E', '9', '125418');
/* Se prueba limites de valores de datos en los campos y existencia de las FK, restricciones Check */


/* Tabla Transferencia */
INSERT INTO Transferencia
    (IdTransfer, FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (14654654654, GETDATE(), '1', 'I', '2', NULL, 'Confirmado');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    ('GETDATEas()', '1', 'I', '2', NULL, 'Confirmado');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (GETDATE(), '3', 'E', '48', 'Santn', 'No se save');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (GETDATE(), '3', 'E', '48', 'Santn', 'Pendiente');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (GETDATE(), '3', 'I', '2', NULL, 'Confirmado');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (GETDATE(), 3, 'E', 2, NULL, 'Confirmado');

INSERT INTO Transferencia
    (FchTransfer, IdMovim, TipoTransfer, CtaDestino, BancoDestino, StatusTransfer)
VALUES
    (GETDATE(), 14, 'I', 2, NULL, 'Pendiente');

/* Se prueba existencia de las FK, restricciones Check y PK */
