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

