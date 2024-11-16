-- Crear la base de datos
CREATE DATABASE PatitosFinancieros;
GO

USE PatitosFinancieros;
GO

-- Crear la tabla de Cuentas Contables (con borrado lógico)
CREATE TABLE CuentasContables (
    CuentaID INT PRIMARY KEY IDENTITY(1,1),
    CodigoCuenta NVARCHAR(20) NOT NULL UNIQUE,
    DescripcionCuenta NVARCHAR(255) NOT NULL,
    Tipo NVARCHAR(50) CHECK (Tipo IN ('Activo', 'Pasivo', 'Patrimonio', 'Ingresos', 'Gastos')),
    SaldoInicial DECIMAL(18, 2) DEFAULT 0.00,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla de Ordenes de Producción (con borrado lógico)
CREATE TABLE OrdenesProduccion (
    OrdenProduccionID INT PRIMARY KEY IDENTITY(1,1),
    DescripcionOrden NVARCHAR(255) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    CostoTotal DECIMAL(18, 2),
    MateriaPrima DECIMAL(18, 2),
    CuentaID INT,
    FOREIGN KEY (CuentaID) REFERENCES CuentasContables(CuentaID),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla de Gastos (con borrado lógico)
CREATE TABLE Gastos (
    GastoID INT PRIMARY KEY IDENTITY(1,1),
    DescripcionGasto NVARCHAR(255) NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    FechaGasto DATE NOT NULL,
    CuentaID INT,
    FOREIGN KEY (CuentaID) REFERENCES CuentasContables(CuentaID),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla de Ventas (con borrado lógico)
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    DescripcionVenta NVARCHAR(255) NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    FechaVenta DATE NOT NULL,
    CuentaID INT,
    FOREIGN KEY (CuentaID) REFERENCES CuentasContables(CuentaID),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla de Usuarios (con borrado lógico)
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    Contrasena NVARCHAR(255) NOT NULL,
    Rol NVARCHAR(50) CHECK (Rol IN ('Gerente', 'Contador', 'Administrador de Gastos', 'Administrador de Ventas')),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla de Perfiles (con borrado lógico, opcional)
CREATE TABLE Perfiles (
    PerfilID INT PRIMARY KEY IDENTITY(1,1),
    DescripcionPerfil NVARCHAR(255) NOT NULL,
    Permisos NVARCHAR(MAX) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO
