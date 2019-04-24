/* Consultas */

USE OBLBD2;
GO


-- A: Mostrar los clientes que han realizado algún movimiento de salida este año, pero que nunca han realizado movimientos de entrada este año.

SELECT DISTINCT Cl.* FROM Cliente Cl INNER JOIN Cuenta Cu ON Cl.IdCliente = Cu.IdCliente
WHERE Cu.IdCuenta NOT IN (SELECT M.IdCuenta FROM Movimiento M WHERE M.TipoMovim = 'E' AND YEAR(M.FchMovim) = YEAR (GETDATE()));


-- B: Proporcionar un listado de los 10 clientes con más saldo a favor del banco, mostrarlo ordenado por importe descendente.



-- C: Mostrar el nombre de cada sucursal, el nombre de cada cliente con cuenta en dicha sucursal y la cantidad de cuentas que posee en dicha sucursal, si hay clientes sin cuentas en alguna sucursal, igual deben figurar sus datos.
SELECT DISTINCT Cl.NombreCliente, Cf.* 
FROM Cliente Cl 
INNER JOIN (
    SELECT C.IdCliente, S.DscSucursal, COUNT(C.IdCliente) AS 'Cantidad de cuentas'
    FROM Cuenta C 
    INNER JOIN Sucursal S ON C.IdSucursal = S.IdSucursal
    GROUP BY C.IdCliente, S.DscSucursal
) Cf ON Cl.IdCliente = Cf.IdCliente;


-- D: Devolver el importe total de depósitos del año, el importe total de retiros del año y el promedio de importes movidos también en el año.

SELECT SUM (M.ImporteMovim) AS 'Depositos'
FROM Movimiento M
WHERE M.TipoMovim = 'E' AND YEAR (M.FchMovim) = YEAR (GETDATE());

SELECT SUM (M.ImporteMovim) AS 'Retiros'
FROM Movimiento M
WHERE M.TipoMovim <> 'S' AND YEAR (M.FchMovim) = YEAR (GETDATE());

SELECT AVG (M.ImporteMovim) AS 'Promedio' FROM Movimiento M
WHERE YEAR (M.FchMovim) = YEAR (GETDATE());

SELECT
    (SELECT SUM (Md.ImporteMovim) FROM Movimiento Md WHERE Md.TipoMovim = 'E') AS 'Depositos',
    (SELECT SUM (Mr.ImporteMovim) FROM Movimiento Mr WHERE Mr.TipoMovim <> 'S') AS 'Retiros',
    (SELECT AVG (Mp.ImporteMovim) FROM Movimiento Mp) AS 'Promedio'
FROM MOVIMIENTO M
WHERE YEAR (M.FchMovim) = YEAR (GETDATE());


-- E: Mostrar los datos de las monedas que tuvieron más movimientos en el Banco en el último año.
SELECT Cu.* FROM Moneda Cu

