use PatitosFinancieros_Suite
GO
-- Procedimiento para listar Usuarios
CREATE PROCEDURE sp_ListarUsuarios
AS
BEGIN
    SELECT 
        u.UsuarioID, 
        u.Contrasena, 
        u.RestablecerContrasena, 
        u.Activo, 
        u.FechaCreacion, 
        u.Cedula, 
        u.RolID,
        p.Nombre,
        p.Apellido,
        p.Correo,
        r.NombreRol AS Rol
    FROM 
        Usuarios u
    INNER JOIN 
        Persona p ON u.Cedula = p.Cedula
    INNER JOIN 
        Roles r ON u.RolID = r.RolID
    WHERE 
        u.Activo = 1;
END;
GO


-- Procedimiento para registrar un nuevo Usuario
CREATE PROCEDURE sp_RegistrarUsuario
    @Contrasena VARCHAR(255),
    @RestablecerContraseña BIT,
    @Cedula INT,
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @Correo NVARCHAR(255),
    @RolID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si la persona ya existe
        IF NOT EXISTS (SELECT 1 FROM Persona WHERE Cedula = @Cedula)
        BEGIN
            INSERT INTO Persona (Cedula, Nombre, Apellido, Correo, Activo)
            VALUES (@Cedula, @Nombre, @Apellido, @Correo, 1);
        END

        INSERT INTO Usuarios (Contrasena, RestablecerContrasena, Activo, FechaCreacion, Cedula, RolID)
        VALUES (@Contrasena, @RestablecerContraseña, 1, GETDATE(), @Cedula, @RolID);

        SET @Resultado = SCOPE_IDENTITY();
        SET @Mensaje = 'Usuario registrado correctamente.';

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
Create PROCEDURE sp_EditarUsuario
    @UsuarioID INT,
    
    @Cedula INT,
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @Correo NVARCHAR(255),
    @RolID INT,
    @Resultado INT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar información de la persona
        UPDATE Persona
        SET Nombre = @Nombre,
            Apellido = @Apellido,
            Correo = @Correo
        WHERE Cedula = @Cedula;

        -- Actualizar información del usuario
        UPDATE Usuarios
        SET 
           
            RolID = @RolID,
            Activo = 1
        WHERE UsuarioID = @UsuarioID;

        SET @Resultado = @UsuarioID;
        SET @Mensaje = 'Usuario actualizado correctamente.';

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
        SET @Mensaje = 'Usuario eliminado correctamente.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedimiento para sp_RestablecerContrasena
CREATE PROCEDURE sp_RestablecerContrasena
    @UsuarioID INT,
    @NuevaContrasena VARCHAR(255),
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar la contraseña y marcarla como restablecida
        UPDATE Usuarios
        SET Contrasena = @NuevaContrasena,
            RestablecerContrasena = 1
        WHERE UsuarioID = @UsuarioID AND Activo = 1;

        IF @@ROWCOUNT > 0
        BEGIN
            SET @Resultado = 1;
            SET @Mensaje = 'Contraseña restablecida correctamente.';
        END
        ELSE
        BEGIN
            SET @Resultado = 0;
            SET @Mensaje = 'No se encontró el usuario o el usuario no está activo.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

USE PatitosFinancieros_Suite
GO

-- Procedimiento para cambiar la clave de un usuario
CREATE PROCEDURE sp_CambiarClave
    @UsuarioID INT,
    @NuevaClave NVARCHAR(255),
    @Resultado BIT OUTPUT,
    @Mensaje NVARCHAR(500) OUTPUT
AS
BEGIN
    SET @Resultado = 0;
    SET @Mensaje = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el usuario existe y está activo
        IF EXISTS (SELECT 1 FROM Usuarios WHERE UsuarioID = @UsuarioID AND Activo = 1)
        BEGIN
            -- Actualizar la contraseña del usuario
            UPDATE Usuarios
            SET Contrasena = @NuevaClave,
                RestablecerContrasena = 0 -- Marcamos que no necesita restablecer
            WHERE UsuarioID = @UsuarioID;

            IF @@ROWCOUNT > 0
            BEGIN
                SET @Resultado = 1;
                SET @Mensaje = 'Contraseña actualizada correctamente.';
            END
            ELSE
            BEGIN
                SET @Resultado = 0;
                SET @Mensaje = 'No se pudo actualizar la contraseña.';
            END
        END
        ELSE
        BEGIN
            SET @Resultado = 0;
            SET @Mensaje = 'Usuario no encontrado o no está activo.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @Resultado = 0;
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

