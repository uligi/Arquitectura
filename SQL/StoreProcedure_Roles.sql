use PatitosFinancieros_Suite
GO

CREATE PROCEDURE sp_ListarRoles
AS
BEGIN
    SELECT 
        RolID,
        NombreRol,
        Descripcion,
        Activo
    FROM 
        Roles
    WHERE 
        Activo = 1;
END;
GO

CREATE PROCEDURE sp_RegistrarRol
    @NombreRol NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Roles (NombreRol, Descripcion, Activo)
        VALUES (@NombreRol, @Descripcion, 1);

        SET @Resultado = SCOPE_IDENTITY();
        SET @Mensaje = 'Rol registrado correctamente.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE PROCEDURE sp_EditarRol
    @RolID INT,
    @NombreRol NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Roles
        SET NombreRol = @NombreRol,
            Descripcion = @Descripcion
        WHERE RolID = @RolID AND Activo = 1;

        SET @Resultado = 1;
        SET @Mensaje = 'Rol actualizado correctamente.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarRol
    @RolID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Roles
        SET Activo = 0
        WHERE RolID = @RolID;

        SET @Resultado = 1;
        SET @Mensaje = 'Rol eliminado correctamente.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO
