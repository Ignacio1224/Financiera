/* Consultas */

USE OBLBD2;
GO


SELECT * FROM Movimiento;
SELECT * FROM Movimiento WHERE TipoMovim = 'E';
SELECT * FROM Movimiento WHERE TipoMovim <> 'E';
SELECT * FROM Cuenta WHERE IdCuenta = 2;
SELECT * FROM Cliente WHERE IdCliente = 2;
SELECT * FROM Cliente;
SELECT * FROM Moneda WHERE IdMoneda = 132;
-- A: Mostrar los clientes que han realizado algún movimiento de salida este año, pero que nunca han realizado movimientos de entrada este año.
SELECT Cl.* FROM Cliente Cl INNER JOIN (
    SELECT Cu.IdCliente FROM Cuenta Cu WHERE Cu.IdCuenta IN (SELECT DISTINCT M.IdCuenta FROM Movimiento M WHERE M.TipoMovim <> 'E' AND YEAR(M.FchMovim) = YEAR (GETDATE()))
) CuM ON Cl.IdCliente = CuM.IdCliente;


-- B: Proporcionar un listado de los 10 clientes con más saldo a favor del banco, mostrarlo ordenado por importe descendente.

-- SALDO
SELECT DISTINCT Me.ImporteMovim - Ms.ImporteMovim AS 'saldo'
FROM Movimiento Me INNER JOIN Movimiento Ms ON Me.IdCuenta = Ms.IdCuenta
WHERE Me.TipoMovim = 'E' AND Ms.TipoMovim <> 'E';

/* Selecciono los clientes */
SELECT C.IdCliente
FROM Cuenta C INNER JOIN (
    /* Aseguro que son 10 cuentas distintas */
    SELECT DISTINCT TOP 10 S.IdCuenta
    FROM
        /* Todos los saldos de cada cuenta */
        (SELECT DISTINCT Me.ImporteMovim - Ms.ImporteMovim AS 'saldo', Me.IdCuenta
        FROM Movimiento Me INNER JOIN Movimiento Ms ON Me.IdCuenta = Ms.IdCuenta
        WHERE Me.TipoMovim = 'E' AND Ms.TipoMovim <> 'E'
        ) AS S
    WHERE S.IdCuenta IN (
        /* Uso solo el IdCuenta para la subquery */
        SELECT T.IdCuenta FROM(
            /* Los 10 saldos mas altos */
            SELECT DISTINCT TOP 10 Me.IdCuenta, Me.ImporteMovim - Ms.ImporteMovim AS 'saldo'
            FROM Movimiento Me INNER JOIN Movimiento Ms ON Me.IdCuenta = Ms.IdCuenta
            WHERE Me.TipoMovim = 'E' AND Ms.TipoMovim <> 'E'
            ORDER BY saldo DESC
        ) AS T
    )
) AS X On C.IdCuenta = X.IdCuenta

 
-- C: Mostrar el nombre de cada sucursal, el nombre de cada cliente con cuenta en dicha sucursal y la cantidad de cuentas que posee en dicha sucursal, si hay clientes sin cuentas en alguna sucursal, igual deben figurar sus datos.
SELECT Cl.NombreCliente, Cf.* 
FROM Cliente Cl 
INNER JOIN (
    SELECT C.IdCliente, S.DscSucursal, COUNT(C.IdCliente) AS 'Cantidad de cuentas'
    FROM Cuenta C 
    INNER JOIN Sucursal S ON C.IdSucursal = S.IdSucursal
    GROUP BY C.IdCliente, S.DscSucursal
) Cf ON Cl.IdCliente = Cf.IdCliente;


-- D: Devolver el importe total de depósitos del año, el importe total de retiros del año y el promedio de importes movidos también en el año.
SELECT DISTINCT
    (SELECT SUM (Md.ImporteMovim) FROM Movimiento Md WHERE Md.TipoMovim = 'E') AS 'Depositos',
    (SELECT SUM (Mr.ImporteMovim) FROM Movimiento Mr WHERE Mr.TipoMovim <> 'S') AS 'Retiros',
    (SELECT AVG (Mp.ImporteMovim) FROM Movimiento Mp) AS 'Promedio'
FROM MOVIMIENTO M
WHERE YEAR (M.FchMovim) = YEAR (GETDATE());


-- E: Mostrar los datos de las monedas que tuvieron más movimientos en el Banco en el último año.
SELECT Cu.*
FROM Moneda Cu INNER JOIN (
    SELECT C .IdMoneda
    FROM Cuenta C INNER JOIN (
        SELECT M.IdCuenta
        FROM Movimiento M
        GROUP BY M.IdCuenta
        HAVING COUNT (M.IdMovim) = (SELECT MAX(T.cantidad_movimientos) AS 'maxima_cantidad'
        FROM (SELECT COUNT(*) AS 'cantidad_movimientos'
            FROM Movimiento
            GROUP BY IdCuenta) T )
    ) MC ON C.IdCuenta = MC.IdCuenta
) CMC ON Cu.IdMoneda = CMC.IdMoneda;
