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
