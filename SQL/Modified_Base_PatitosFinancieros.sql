-- Crear la base de datos
CREATE DATABASE PatitosFinancieros_Suite;
GO

USE PatitosFinancieros_Suite;
GO

-- Tabla de Cuentas Contables con borrado lógico
CREATE TABLE CuentasContables (
    CuentaID INT PRIMARY KEY IDENTITY(1,1),
    CodigoCuenta NVARCHAR(20) NOT NULL UNIQUE, -- Código de cuenta siguiendo el formato del manual
    DescripcionCuenta NVARCHAR(255) NOT NULL, -- Descripción de la cuenta según el manual
    Clase NVARCHAR(50), -- Clase de la cuenta (ej. 'Activo', 'Pasivo')
    Grupo NVARCHAR(50), -- Grupo al que pertenece la cuenta (ej. 'Activo Corriente')
    Rubro NVARCHAR(50), -- Rubro de la cuenta
    Subcuenta NVARCHAR(50), -- Detalle de subcuenta
    Nivel INT NOT NULL, -- Nivel de la cuenta (ej. 1 a 7)
    CodigoPadre NVARCHAR(20), -- Código de la cuenta padre para jerarquías
    SaldoInicial DECIMAL(18, 2) DEFAULT 0.00,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1 -- Borrado lógico
);
GO


-- Índice para optimizar consultas basadas en CodigoCuenta
CREATE INDEX IDX_CodigoCuenta ON CuentasContables (CodigoCuenta);
GO

-- Tabla de Ordenes de Producción con borrado lógico
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

-- Índice para optimizar consultas basadas en FechaInicio
CREATE INDEX IDX_FechaInicio ON OrdenesProduccion (FechaInicio);
GO

-- Tabla de Registro de Gastos con campos adicionales y borrado lógico
CREATE TABLE RegistroGastos (
    GastoID INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(255) NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    FechaGasto DATE NOT NULL,
    Categoria NVARCHAR(100) NOT NULL,  -- Campo adicional para categorizar gastos
    ReferenciaExterna NVARCHAR(50),    -- Campo opcional para referencias externas
    CuentaID INT,
    FOREIGN KEY (CuentaID) REFERENCES CuentasContables(CuentaID),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Índice para optimizar consultas por fecha de gasto
CREATE INDEX IDX_FechaGasto ON RegistroGastos (FechaGasto);
GO

-- Tabla de Registro de Ventas con campos adicionales y borrado lógico
CREATE TABLE RegistroVentas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(255) NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    FechaVenta DATE NOT NULL,
    Categoria NVARCHAR(100) NOT NULL,  -- Campo adicional para categorizar ventas
    ReferenciaExterna NVARCHAR(50),    -- Campo opcional para referencias externas
    CuentaID INT,
    FOREIGN KEY (CuentaID) REFERENCES CuentasContables(CuentaID),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Índice para optimizar consultas por fecha de venta
CREATE INDEX IDX_FechaVenta ON RegistroVentas (FechaVenta);
GO

-- Crear la tabla Persona
CREATE TABLE Persona (
    Cedula INT PRIMARY KEY,
    Nombre NVARCHAR(255) NOT NULL,
    Apellido NVARCHAR(255) NOT NULL,
	Correo NVARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla Roles
CREATE TABLE Roles (
    RolID INT PRIMARY KEY IDENTITY(1,1),
    NombreRol NVARCHAR(50) NOT NULL UNIQUE,
    Descripcion NVARCHAR(255),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO

-- Crear la tabla Usuarios con estructura actualizada y borrado lógico
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Contrasena VARCHAR(255) NOT NULL,
    RestablecerContrasena BIT NOT NULL,
    Activo BIT NOT NULL DEFAULT 1,  -- Borrado lógico
    FechaCreacion DATE DEFAULT GETDATE(),
    Cedula INT NOT NULL,
    RolID INT NOT NULL,
    FOREIGN KEY (Cedula) REFERENCES Persona(Cedula),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID)
);
GO

-- Relación de Roles y Acceso a Módulos con borrado lógico
CREATE TABLE PermisosModulo (
    ModuloID INT PRIMARY KEY IDENTITY(1,1),
    NombreModulo NVARCHAR(100) UNIQUE NOT NULL,
    RolPermitido NVARCHAR(20) CHECK (RolPermitido IN ('empleado', 'gerente')),
    Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico
);
GO
