use PatitosFinancieros_Suite;
go

CREATE PROCEDURE sp_ProyeccionesDeGastos
AS
BEGIN
    WITH GastosMensuales AS (
        SELECT 
            YEAR(FechaGasto) AS A�o,
            MONTH(FechaGasto) AS Mes,
            SUM(Monto) AS TotalGasto
        FROM RegistroGastos
        WHERE Activo = 1
        GROUP BY YEAR(FechaGasto), MONTH(FechaGasto)
    )
    SELECT 
        YEAR(GETDATE()) AS A�oProyectado,
        MONTH(GETDATE()) + ROW_NUMBER() OVER (ORDER BY A�o, Mes) AS MesProyectado,
        AVG(TotalGasto) AS ProyeccionGasto
    FROM GastosMensuales
    GROUP BY A�o, Mes;
END;
GO

CREATE PROCEDURE sp_ProyeccionesDeVentas
AS
BEGIN
    WITH VentasMensuales AS (
        SELECT 
            YEAR(FechaVenta) AS A�o,
            MONTH(FechaVenta) AS Mes,
            SUM(Monto) AS TotalVenta
        FROM RegistroVentas
        WHERE Activo = 1
        GROUP BY YEAR(FechaVenta), MONTH(FechaVenta)
    )
    SELECT 
        YEAR(GETDATE()) AS A�oProyectado,
        MONTH(GETDATE()) + ROW_NUMBER() OVER (ORDER BY A�o, Mes) AS MesProyectado,
        AVG(TotalVenta) AS ProyeccionVenta
    FROM VentasMensuales
    GROUP BY A�o, Mes;
END;
GO
