use PatitosFinancieros_Suite
GO

CREATE PROCEDURE sp_ProyeccionesDeGastos
AS
BEGIN
    WITH GastosMensuales AS (
        SELECT 
            YEAR(FechaGasto) AS Año,
            MONTH(FechaGasto) AS Mes,
            SUM(Monto) AS TotalGasto
        FROM RegistroGastos
        WHERE Activo = 1
        GROUP BY YEAR(FechaGasto), MONTH(FechaGasto)
    ),
    Numerados AS (
        SELECT 
            ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Numero,
            AVG(TotalGasto) AS ProyeccionGasto
        FROM GastosMensuales
    )
    SELECT 
        DATEADD(MONTH, Numero, GETDATE()) AS MesProyectado,
        ProyeccionGasto
    FROM Numerados
    WHERE Numero <= 12
    ORDER BY MesProyectado;
END;
GO


Create PROCEDURE sp_ProyeccionesDeVentas
    @MesSeleccionado DATE
AS
BEGIN
    WITH VentasMensuales AS (
        SELECT 
            YEAR(FechaVenta) AS Año,
            MONTH(FechaVenta) AS Mes,
            SUM(Monto) AS TotalVenta
        FROM RegistroVentas
        WHERE Activo = 1
        GROUP BY YEAR(FechaVenta), MONTH(FechaVenta)
    ),
    Numerados AS (
        SELECT 
            ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Numero,
            AVG(TotalVenta) AS ProyeccionVenta
        FROM VentasMensuales
    )
    SELECT 
        DATEADD(MONTH, Numero, @MesSeleccionado) AS MesProyectado,
        ProyeccionVenta
    FROM Numerados
    WHERE Numero <= 12
    ORDER BY MesProyectado;
END;
GO

EXEC sp_ProyeccionesDeVentas;
