USE PatitosFinancieros_Suite;
GO

-- Procedimiento para listar Cuentas Contables
CREATE PROCEDURE sp_ListarCuentasContables
AS
BEGIN
    SELECT 
        CuentaID, 
        CodigoCuenta, 
        DescripcionCuenta, 
        Clase, 
        Grupo, 
        Rubro, 
        Subcuenta, 
        Nivel, 
        CodigoPadre, 
        SaldoInicial, 
        FechaCreacion, 
        Activo
    FROM 
        CuentasContables
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar una nueva Cuenta Contable
CREATE PROCEDURE sp_RegistrarCuentaContable
    @CodigoCuenta NVARCHAR(20),
    @DescripcionCuenta NVARCHAR(255),
    @Clase NVARCHAR(50),
    @Grupo NVARCHAR(50),
    @Rubro NVARCHAR(50),
    @Subcuenta NVARCHAR(50),
    @Nivel INT,
    @CodigoPadre NVARCHAR(20),
    @SaldoInicial DECIMAL(18, 2),
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO CuentasContables (CodigoCuenta, DescripcionCuenta, Clase, Grupo, Rubro, Subcuenta, Nivel, CodigoPadre, SaldoInicial, Activo)
        VALUES (@CodigoCuenta, @DescripcionCuenta, @Clase, @Grupo, @Rubro, @Subcuenta, @Nivel, @CodigoPadre, @SaldoInicial, 1);

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

-- Procedimiento para editar una Cuenta Contable
CREATE PROCEDURE sp_EditarCuentaContable
    @CuentaID INT,
    @CodigoCuenta NVARCHAR(20),
    @DescripcionCuenta NVARCHAR(255),
    @Clase NVARCHAR(50),
    @Grupo NVARCHAR(50),
    @Rubro NVARCHAR(50),
    @Subcuenta NVARCHAR(50),
    @Nivel INT,
    @CodigoPadre NVARCHAR(20),
    @SaldoInicial DECIMAL(18, 2),
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE CuentasContables
        SET CodigoCuenta = @CodigoCuenta,
            DescripcionCuenta = @DescripcionCuenta,
            Clase = @Clase,
            Grupo = @Grupo,
            Rubro = @Rubro,
            Subcuenta = @Subcuenta,
            Nivel = @Nivel,
            CodigoPadre = @CodigoPadre,
            SaldoInicial = @SaldoInicial,
            Activo = 1
        WHERE CuentaID = @CuentaID;

        SET @Resultado = @CuentaID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) una Cuenta Contable
CREATE PROCEDURE sp_EliminarCuentaContable
    @CuentaID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE CuentasContables
        SET Activo = 0
        WHERE CuentaID = @CuentaID;

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
