
use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Permisos de Módulos
CREATE PROCEDURE sp_ListarPermisosModulo
AS
BEGIN
    SELECT 
        ModuloID, 
        NombreModulo, 
        RolPermitido, 
        Activo
    FROM 
        PermisosModulo
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar un nuevo Permiso de Módulo
CREATE PROCEDURE sp_RegistrarPermisoModulo
    @NombreModulo NVARCHAR(100),
    @RolPermitido NVARCHAR(20),
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO PermisosModulo (NombreModulo, RolPermitido, Activo)
        VALUES (@NombreModulo, @RolPermitido, 1);

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

-- Procedimiento para editar un Permiso de Módulo
CREATE PROCEDURE sp_EditarPermisoModulo
    @ModuloID INT,
    @NombreModulo NVARCHAR(100),
    @RolPermitido NVARCHAR(20),
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE PermisosModulo
        SET NombreModulo = @NombreModulo,
            RolPermitido = @RolPermitido,
            Activo = 1
        WHERE ModuloID = @ModuloID;

        SET @Resultado = @ModuloID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) un Permiso de Módulo
CREATE PROCEDURE sp_EliminarPermisoModulo
    @ModuloID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE PermisosModulo
        SET Activo = 0
        WHERE ModuloID = @ModuloID;

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
