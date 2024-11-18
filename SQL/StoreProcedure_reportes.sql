use PatitosFinancieros_Suite
GO
-- Procedimiento para generar reporte de proyecciones de gastos
CREATE PROCEDURE sp_ReporteProyeccionGastos
AS
BEGIN
    SELECT 
        FechaGasto, 
        SUM(Monto) AS TotalGastos,
        Categoria
    FROM 
        RegistroGastos
    WHERE 
        Activo = 1
    GROUP BY 
        FechaGasto, Categoria
    ORDER BY 
        FechaGasto DESC;
END;
GO

-- Procedimiento para generar reporte de proyecciones de ventas
CREATE PROCEDURE sp_ReporteProyeccionVentas
AS
BEGIN
    SELECT 
        FechaVenta, 
        SUM(Monto) AS TotalVentas,
        Categoria
    FROM 
        RegistroVentas
    WHERE 
        Activo = 1
    GROUP BY 
        FechaVenta, Categoria
    ORDER BY 
        FechaVenta DESC;
END;
GO
