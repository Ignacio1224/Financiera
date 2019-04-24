/* Creo la Base de Datos*/

CREATE DATABASE OBLBD2;
GO

USE OBLBD2;
GO
/* Creo las tablas */

CREATE TABLE Sucursal(
    IdSucursal CHARACTER (5) NOT NULL,
    DscSucursal VARCHAR (20),
    DirSucursal VARCHAR (25),
    MailSucursal VARCHAR (30),
    TelSucursal VARCHAR (30)
);
GO

CREATE TABLE TipoCuenta (
    IdTipo CHARACTER (3) NOT NULL,
    DscTipo VARCHAR (20)
);
GO

CREATE TABLE Moneda (
    IdMoneda NUMERIC (6) NOT NULL,
    DscMoneda VARCHAR (30) NOT NULL,
    SimboloMoneda CHAR (5)
);
GO

CREATE TABLE Cliente (
    IdCliente NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    NombreCliente VARCHAR (30),
    TipoCliente CHARACTER (1),
    TelCliente VARCHAR (30),
    MailCliente VARCHAR (30)
);
GO

CREATE TABLE Cuenta (
    IdCuenta NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    IdTipo CHARACTER (3),
    IdMoneda NUMERIC (6),
    IdSucursal CHARACTER (5)
);
GO

CREATE TABLE Movimiento (
    IdMovim NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    FchMovim DATETIME,
    TipoMovim CHARACTER (1),
    IdCuenta NUMERIC (5),
    ImporteMovim MONEY
);
GO

CREATE TABLE Transferencia (
    IdTransfer NUMERIC (5) IDENTITY (1, 1) NOT NULL,
    FchTransfer DATETIME,
    IdMovim NUMERIC (5),
    TipoTransfer CHARACTER (1),
    CtaDestino NUMERIC (5),
    BancoDestino VARCHAR (30),
    StatusTransfer VARCHAR (10)
);
GO
