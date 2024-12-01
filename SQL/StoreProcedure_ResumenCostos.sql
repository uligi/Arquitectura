use PatitosFinancieros_Suite
GO 

CREATE PROCEDURE sp_ResumenCostosSinTabla
AS
BEGIN
    SELECT 
        op.OrdenProduccionID,
        op.DescripcionOrden,
        ISNULL(SUM(rg.Monto), 0) AS TotalCostos,
        ISNULL(SUM(rv.Monto), 0) AS TotalVentas,
        ISNULL(SUM(rv.Monto), 0) - ISNULL(SUM(rg.Monto), 0) AS Rentabilidad
    FROM OrdenesProduccion op
    LEFT JOIN RegistroGastos rg ON op.CuentaID = rg.CuentaID AND rg.Activo = 1
    LEFT JOIN RegistroVentas rv ON op.CuentaID = rv.CuentaID AND rv.Activo = 1
    WHERE op.Activo = 1
    GROUP BY op.OrdenProduccionID, op.DescripcionOrden;
END;
GO
