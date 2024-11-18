use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Registro de Ventas
CREATE PROCEDURE sp_ListarRegistroVentas
AS
BEGIN
    SELECT 
        VentaID, 
        Descripcion, 
        Monto, 
        FechaVenta, 
        Categoria, 
        ReferenciaExterna, 
        CuentaID, 
        Activo
    FROM 
        RegistroVentas
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar una nueva Venta
CREATE PROCEDURE sp_RegistrarRegistroVentas
    @Descripcion NVARCHAR(255),
    @Monto DECIMAL(18, 2),
    @FechaVenta DATE,
    @Categoria NVARCHAR(100),
    @ReferenciaExterna NVARCHAR(50),
    @CuentaID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO RegistroVentas (Descripcion, Monto, FechaVenta, Categoria, ReferenciaExterna, CuentaID, Activo)
        VALUES (@Descripcion, @Monto, @FechaVenta, @Categoria, @ReferenciaExterna, @CuentaID, 1);

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

-- Procedimiento para editar una Venta
CREATE PROCEDURE sp_EditarRegistroVentas
    @VentaID INT,
    @Descripcion NVARCHAR(255),
    @Monto DECIMAL(18, 2),
    @FechaVenta DATE,
    @Categoria NVARCHAR(100),
    @ReferenciaExterna NVARCHAR(50),
    @CuentaID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE RegistroVentas
        SET Descripcion = @Descripcion,
            Monto = @Monto,
            FechaVenta = @FechaVenta,
            Categoria = @Categoria,
            ReferenciaExterna = @ReferenciaExterna,
            CuentaID = @CuentaID,
            Activo = 1
        WHERE VentaID = @VentaID;

        SET @Resultado = @VentaID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) una Venta
CREATE PROCEDURE sp_EliminarRegistroVentas
    @VentaID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE RegistroVentas
        SET Activo = 0
        WHERE VentaID = @VentaID;

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
