/* Definición de las restricciones */

USE OBLBD2;
GO

/* Tabla Sucursal */
-- PRYMARY KEY IdSucursal
    ALTER TABLE Sucursal ADD CONSTRAINT pk_Sucursal PRIMARY KEY (IdSucursal);
-- NOT NULL MailSucursal
    ALTER TABLE Sucursal ALTER COLUMN MailSucursal VARCHAR (30) NOT NULL;
-- UNIQUE MailSucursal
    ALTER TABLE Sucursal ADD CONSTRAINT unique_MailSucursal_Sucursal UNIQUE (MailSucursal);


/* Tabla TipoCuenta */
-- PRYMARY KEY IdTipo
    ALTER TABLE TipoCuenta ADD CONSTRAINT pk_TipoCuenta PRIMARY KEY (IdTipo);


/* Tabla Moneda */
-- PRYMARY KEY IdMoneda
    ALTER TABLE Moneda ADD CONSTRAINT pk_Moneda PRIMARY KEY (IdMoneda);
-- NOT NULL SimboloMoneda
    ALTER TABLE Moneda ALTER COLUMN SimboloMoneda CHARACTER (5) NOT NULL;


/* Tabla Cliente */
-- PRYMARY KEY IdCliente
    ALTER TABLE Cliente ADD CONSTRAINT pk_Cliente PRIMARY KEY (IdCliente);
-- CHECK TipoCliente [P = Persona, E = Empresa]
    ALTER TABLE Cliente ADD CONSTRAINT check_TipoCliente_Cliente CHECK (TipoCliente IN ('P', 'E'));
-- UNIQUE MailCliente
    ALTER TABLE Cliente ADD CONSTRAINT unique_MailCliente_Cliente UNIQUE (MailCliente);


/* Tabla Cuenta */
-- PRYMARY KEY IdCuenta
    ALTER TABLE Cuenta ADD CONSTRAINT pk_Cuenta PRIMARY KEY (IdCuenta);
-- ADD IdCliente
    ALTER TABLE Cuenta ADD IdCliente NUMERIC (5) NOT NULL; 
-- FOREIGN KEY IdSucursal TO Sucursal
    ALTER TABLE Cuenta ADD CONSTRAINT fk_IdSucursal_Cuenta FOREIGN KEY (IdSucursal) REFERENCES Sucursal (IdSucursal);
-- FOREIGN KEY IdCliente TO Cliente
    ALTER TABLE Cuenta ADD CONSTRAINT fk_IdCliente_Cuenta FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente);
-- FOREIGN KEY IdMoneda TO Moneda
    ALTER TABLE Cuenta ADD CONSTRAINT fk_IdMoneda_Cuenta FOREIGN KEY (IdMoneda) REFERENCES Moneda (IdMoneda);

/* Tabla Movimiento */
-- PRYMARY KEY IdMovim
    ALTER TABLE Movimiento ADD CONSTRAINT pk_Movimiento PRIMARY KEY (IdMovim);
-- FOREIGN KEY IdCuenta To Cuenta
    ALTER TABLE Movimiento ADD CONSTRAINT fk_IdCuenta_Movimiento FOREIGN KEY (IdCuenta) REFERENCES Cuenta (IdCuenta); 
-- CHECK TipoMovim [E = Entrada, S = Salida, T = Transferencia]
    ALTER TABLE Movimiento ADD CONSTRAINT check_TipoMovim_Movimiento CHECK (TipoMovim IN ('E', 'S', 'T'));


/* Tabla Transferencia */
-- PRYMARY KEY
    ALTER TABLE Transferencia ADD CONSTRAINT pk_Transferencia PRIMARY KEY (IdTransfer);
-- CHECK TipoTransfer [I = Internas, E = Externas]
    ALTER TABLE Transferencia ADD CONSTRAINT check_TipoTransfer_Transferencia CHECK (TipoTransfer IN ('I', 'E'));
-- CHECK StatusTransfer [Confirmado, Pendiente, Rechazada]
    ALTER TABLE Transferencia ADD CONSTRAINT check_StatusTransfer_Transferencia CHECK (StatusTransfer IN ('Confirmado', 'Pendiente', 'Rechazada'));
-- RNE: Si son del tipo 'Internas' se debe validad que el valor del campo 'CtaDestino' exista en la tabla Cuenta.
-- RNE: Si son del tipo 'Externas' se debe validar que el valor del campo 'BancoDestino' no sea nulo.
