use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Usuarios
CREATE PROCEDURE sp_ListarUsuarios
AS
BEGIN
    SELECT 
        UsuarioID, 
        Contrasena, 
        RestablecerContraseña, 
        Activo, 
        FechaCreacion, 
        Cedula, 
        RolID
    FROM 
        Usuarios
    WHERE 
        Activo = 1;
END;
GO

-- Procedimiento para registrar un nuevo Usuario
CREATE PROCEDURE sp_RegistrarUsuario
    @Contrasena VARCHAR(255),
    @RestablecerContraseña BIT,
    @Cedula INT,
    @RolID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Usuarios (Contrasena, RestablecerContraseña, Activo, FechaCreacion, Cedula, RolID)
        VALUES (@Contrasena, @RestablecerContraseña, 1, GETDATE(), @Cedula, @RolID);

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

-- Procedimiento para editar un Usuario
CREATE PROCEDURE sp_EditarUsuario
    @UsuarioID INT,
    @Contrasena VARCHAR(255),
    @RestablecerContraseña BIT,
    @Cedula INT,
    @RolID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Usuarios
        SET Contrasena = @Contrasena,
            RestablecerContraseña = @RestablecerContraseña,
            Cedula = @Cedula,
            RolID = @RolID,
            Activo = 1
        WHERE UsuarioID = @UsuarioID;

        SET @Resultado = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para eliminar (borrado lógico) un Usuario
CREATE PROCEDURE sp_EliminarUsuario
    @UsuarioID INT,
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Usuarios
        SET Activo = 0
        WHERE UsuarioID = @UsuarioID;

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
