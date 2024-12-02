use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Registro de Gastos
CREATE PROCEDURE sp_ListarRegistroGastos
AS
BEGIN
    SELECT 
        GastoID, 
        Descripcion, 
        Monto, 
        FechaGasto, 
        Categoria, 
        ReferenciaExterna, 
        CuentaID, 
        Activo
    FROM 
        RegistroGastos
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar un nuevo Gasto
CREATE PROCEDURE sp_RegistrarRegistroGastos
    @Descripcion NVARCHAR(255),
    @Monto DECIMAL(18, 2),
    @FechaGasto DATE,
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

        INSERT INTO RegistroGastos (Descripcion, Monto, FechaGasto, Categoria, ReferenciaExterna, CuentaID, Activo)
        VALUES (@Descripcion, @Monto, @FechaGasto, @Categoria, @ReferenciaExterna, @CuentaID, 1);

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

-- Procedimiento para editar un Gasto
CREATE PROCEDURE sp_EditarRegistroGastos
    @GastoID INT,
    @Descripcion NVARCHAR(255),
    @Monto DECIMAL(18, 2),
    @FechaGasto DATE,
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

        UPDATE RegistroGastos
        SET Descripcion = @Descripcion,
            Monto = @Monto,
            FechaGasto = @FechaGasto,
            Categoria = @Categoria,
            ReferenciaExterna = @ReferenciaExterna,
            CuentaID = @CuentaID,
            Activo = 1
        WHERE GastoID = @GastoID;

        SET @Resultado = @GastoID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) un Gasto
CREATE PROCEDURE sp_EliminarRegistroGastos
    @GastoID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE RegistroGastos
        SET Activo = 0
        WHERE GastoID = @GastoID;

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
