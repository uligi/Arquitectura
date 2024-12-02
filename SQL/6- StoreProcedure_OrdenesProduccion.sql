
use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Ordenes de Producción
CREATE PROCEDURE sp_ListarOrdenesProduccion
AS
BEGIN
    SELECT 
        OrdenProduccionID, 
        DescripcionOrden, 
        FechaInicio, 
        FechaFin, 
        CostoTotal, 
        MateriaPrima, 
        CuentaID, 
        Activo
    FROM 
        OrdenesProduccion
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar una nueva Orden de Producción
CREATE PROCEDURE sp_RegistrarOrdenesProduccion
    @DescripcionOrden NVARCHAR(255),
    @FechaInicio DATE,
    @FechaFin DATE,
    @CostoTotal DECIMAL(18, 2),
    @MateriaPrima DECIMAL(18, 2),
    @CuentaID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO OrdenesProduccion (DescripcionOrden, FechaInicio, FechaFin, CostoTotal, MateriaPrima, CuentaID, Activo)
        VALUES (@DescripcionOrden, @FechaInicio, @FechaFin, @CostoTotal, @MateriaPrima, @CuentaID, 1);

        SET @Resultado = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para editar una Orden de Producción
CREATE PROCEDURE sp_EditarOrdenesProduccion
    @OrdenProduccionID INT,
    @DescripcionOrden NVARCHAR(255),
    @FechaInicio DATE,
    @FechaFin DATE,
    @CostoTotal DECIMAL(18, 2),
    @MateriaPrima DECIMAL(18, 2),
    @CuentaID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE OrdenesProduccion
        SET DescripcionOrden = @DescripcionOrden,
            FechaInicio = @FechaInicio,
            FechaFin = @FechaFin,
            CostoTotal = @CostoTotal,
            MateriaPrima = @MateriaPrima,
            CuentaID = @CuentaID,
            Activo = 1
        WHERE OrdenProduccionID = @OrdenProduccionID;

        SET @Resultado = @OrdenProduccionID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) una Orden de Producción
CREATE PROCEDURE sp_EliminarOrdenesProduccion
    @OrdenProduccionID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE OrdenesProduccion
        SET Activo = 0
        WHERE OrdenProduccionID = @OrdenProduccionID;

        SET @Resultado = 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO
