USE PatitosFinancieros_Suite;
GO

DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable 
    @CodigoCuenta = '1001',
    @DescripcionCuenta = 'Caja General',
    @Clase = 'Activo',
    @Grupo = 'Activo Corriente',
    @Rubro = 'Caja',
    @Subcuenta = NULL,
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 50000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
go

DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable 
    @CodigoCuenta = '1001-1',
    @DescripcionCuenta = 'Caja Chica',
    @Clase = 'Activo',
    @Grupo = 'Activo Corriente',
    @Rubro = 'Caja',
    @Subcuenta = 'Operaciones Diarias',
    @Nivel = 2,
    @CodigoPadre = '1001',
    @SaldoInicial = 10000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
go

DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable 
    @CodigoCuenta = '2001',
    @DescripcionCuenta = 'Cuentas por Pagar',
    @Clase = 'Pasivo',
    @Grupo = 'Pasivo Corriente',
    @Rubro = 'Deudas Comerciales',
    @Subcuenta = NULL,
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 30000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
go

DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable 
    @CodigoCuenta = '3001',
    @DescripcionCuenta = 'Capital Social',
    @Clase = 'Patrimonio',
    @Grupo = NULL,
    @Rubro = NULL,
    @Subcuenta = NULL,
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 0.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
go

DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable 
    @CodigoCuenta = '4001',
    @DescripcionCuenta = 'Ingresos por Ventas',
    @Clase = 'Ingreso',
    @Grupo = 'Ingresos Operativos',
    @Rubro = 'Ventas',
    @Subcuenta = 'Ventas Nacionales',
    @Nivel = 2,
    @CodigoPadre = NULL,
    @SaldoInicial = 0.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
go