use PatitosFinancieros_Suite
go

------------------------------- USUARIOS----------------------------

-- Usuario 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = '31f7462d336bd1ef7a3675dd2c6705fb0d224cf35b9b424a0370e03a1e92dea4', -- Contrase : 12345Pass!
    @RestablecerContraseña = 0,
    @Cedula = 101010101,
    @Nombre = 'Juan',
    @Apellido = 'Pérez',
    @Correo = 'juan.perez@example.com',
    @RolID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = 'fb819516fe2c9bb8cc5ffc38c1a445d15e569ebaee0cb2b1db8b55e86ec1ea61',-- Contrase : MySecurePass2
    @RestablecerContraseña = 0,
    @Cedula = 202020202,
    @Nombre = 'María',
    @Apellido = 'Gómez',
    @Correo = 'maria.gomez@example.com',
    @RolID = 2,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = '4f3931dcc4bf50187c1bbac32400b1d847c3b415e40949504424e7ecaab7945f', -- Contrase : Secure$456
    @RestablecerContraseña = 0,
    @Cedula = 303030303,
    @Nombre = 'Pedro',
    @Apellido = 'Ramírez',
    @Correo = 'pedro.ramirez@example.com',
    @RolID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = 'e66860546f18cdbbcd86b35e18b525bffc67f772c650cedfe3ff7a0026fa1dee',-- Contrase : Passw0rd!
    @RestablecerContraseña = 0,
    @Cedula = 404040404,
    @Nombre = 'Ana',
    @Apellido = 'López',
    @Correo = 'ana.lopez@example.com',
    @RolID = 3,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 5
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = 'f905024bd96c770881009fd87b22dd8d6831595072312a251cd3fa37f6861bc5', --Contrase : Hello123!
    @RestablecerContraseña = 0,
    @Cedula = 505050505,
    @Nombre = 'Luis',
    @Apellido = 'Torres',
    @Correo = 'luis.torres@example.com',
    @RolID = 2,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 6
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = '3e3bbeb89f7f76f8aea401d9d42a8c7b8ecee88250a13c5c1dd954d86f3e889a', -- Contrase : Qwerty!789
    @RestablecerContraseña = 0,
    @Cedula = 606060606,
    @Nombre = 'Claudia',
    @Apellido = 'Martínez',
    @Correo = 'claudia.martinez@example.com',
    @RolID = 3,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Usuario 7
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarUsuario
    @Contrasena = '513e0eadd1797d65bb277b9b4de782124731935e83e6e3948fd970371761e900', --Contrase : Admin$1234
    @RestablecerContraseña = 0,
    @Cedula = 707070707,
    @Nombre = 'Carlos',
    @Apellido = 'Jiménez',
    @Correo = 'carlos.jimenez@example.com',
    @RolID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

------------------------------- Permisos----------------------------

-- Permiso 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarPermisoModulo
    @NombreModulo = 'Gestión de Productos',
    @RolPermitido = 'gerente',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Permiso 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarPermisoModulo
    @NombreModulo = 'Gestión de Inventario',
    @RolPermitido = 'empleado',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Permiso 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarPermisoModulo
    @NombreModulo = 'Reportes de Ventas',
    @RolPermitido = 'gerente',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Permiso 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarPermisoModulo
    @NombreModulo = 'Gestión de Usuarios',
    @RolPermitido = 'gerente',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

------------------------------- Roles----------------------------

-- Rol 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRol
    @NombreRol = 'Administrador',
    @Descripcion = 'Tiene acceso completo al sistema, incluyendo configuración y administración de usuarios.',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Rol 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRol
    @NombreRol = 'Gerente',
    @Descripcion = 'Puede acceder a módulos relacionados con reportes y gestión general.',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Rol 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRol
    @NombreRol = 'Empleado',
    @Descripcion = 'Tiene acceso a las funcionalidades básicas asignadas para la gestión diaria.',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Rol 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRol
    @NombreRol = 'Soporte Técnico',
    @Descripcion = 'Responsable de la gestión técnica y resolución de problemas dentro del sistema.',
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

------------------------------- Cuentas contables----------------------------

-- Cuenta Contable 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '1001',
    @DescripcionCuenta = 'Caja General',
    @Clase = 'Activo',
    @Grupo = 'Circulante',
    @Rubro = 'Efectivo y Equivalentes',
    @Subcuenta = 'Caja',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 50000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go


-- Cuenta Contable 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '1101',
    @DescripcionCuenta = 'Bancos Nacionales',
    @Clase = 'Activo',
    @Grupo = 'Circulante',
    @Rubro = 'Efectivo y Equivalentes',
    @Subcuenta = 'Bancos',
    @Nivel = 1,
    @CodigoPadre = '1001',
    @SaldoInicial = 150000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go


-- Cuenta Contable 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '2001',
    @DescripcionCuenta = 'Cuentas por Pagar',
    @Clase = 'Pasivo',
    @Grupo = 'Circulante',
    @Rubro = 'Obligaciones',
    @Subcuenta = 'Proveedores',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 80000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '2101',
    @DescripcionCuenta = 'Préstamos Bancarios',
    @Clase = 'Pasivo',
    @Grupo = 'No Circulante',
    @Rubro = 'Obligaciones a Largo Plazo',
    @Subcuenta = 'Deudas Bancarias',
    @Nivel = 2,
    @CodigoPadre = '2001',
    @SaldoInicial = 300000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 5
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '3001',
    @DescripcionCuenta = 'Capital Social',
    @Clase = 'Patrimonio',
    @Grupo = 'Aportaciones',
    @Rubro = 'Capital',
    @Subcuenta = 'Accionistas',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 1000000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 6
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '3101',
    @DescripcionCuenta = 'Reservas Legales',
    @Clase = 'Patrimonio',
    @Grupo = 'Reservas',
    @Rubro = 'Reservas Generales',
    @Subcuenta = 'Legales',
    @Nivel = 2,
    @CodigoPadre = '3001',
    @SaldoInicial = 50000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 7
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '4001',
    @DescripcionCuenta = 'Ingresos por Ventas',
    @Clase = 'Ingresos',
    @Grupo = 'Operacionales',
    @Rubro = 'Ventas Netas',
    @Subcuenta = 'Productos',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 0.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 8
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '5001',
    @DescripcionCuenta = 'Costos de Ventas',
    @Clase = 'Costos',
    @Grupo = 'Operacionales',
    @Rubro = 'Costos Directos',
    @Subcuenta = 'Mercaderías',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 0.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 9
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '6001',
    @DescripcionCuenta = 'Gastos Administrativos',
    @Clase = 'Gastos',
    @Grupo = 'Operacionales',
    @Rubro = 'Administrativos',
    @Subcuenta = 'Oficinas',
    @Nivel = 1,
    @CodigoPadre = NULL,
    @SaldoInicial = 20000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Cuenta Contable 10
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarCuentaContable
    @CodigoCuenta = '6101',
    @DescripcionCuenta = 'Gastos de Ventas',
    @Clase = 'Gastos',
    @Grupo = 'Operacionales',
    @Rubro = 'Ventas y Distribución',
    @Subcuenta = 'Publicidad',
    @Nivel = 2,
    @CodigoPadre = '6001',
    @SaldoInicial = 10000.00,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

------------------------------- Registro de ventas----------------------------

-- Registro de Venta 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de producto A',
    @Monto = 1500.00,
    @FechaVenta = '2024-11-01',
    @Categoria = 'Productos',
    @ReferenciaExterna = 'REF001',
    @CuentaID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de servicio B',
    @Monto = 2500.50,
    @FechaVenta = '2024-11-02',
    @Categoria = 'Servicios',
    @ReferenciaExterna = 'REF002',
    @CuentaID = 2,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta mayorista C',
    @Monto = 5000.00,
    @FechaVenta = '2024-11-03',
    @Categoria = 'Mayorista',
    @ReferenciaExterna = 'REF003',
    @CuentaID = 3,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta al contado D',
    @Monto = 300.75,
    @FechaVenta = '2024-11-04',
    @Categoria = 'Contado',
    @ReferenciaExterna = 'REF004',
    @CuentaID = 4,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 5
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de suscripción E',
    @Monto = 1200.00,
    @FechaVenta = '2024-11-05',
    @Categoria = 'Suscripciones',
    @ReferenciaExterna = 'REF005',
    @CuentaID = 5,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 6
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de software F',
    @Monto = 4500.00,
    @FechaVenta = '2024-11-06',
    @Categoria = 'Software',
    @ReferenciaExterna = 'REF006',
    @CuentaID = 6,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 7
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de consultoría G',
    @Monto = 8000.00,
    @FechaVenta = '2024-11-07',
    @Categoria = 'Consultoría',
    @ReferenciaExterna = 'REF007',
    @CuentaID = 7,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 8
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de paquete promocional H',
    @Monto = 999.99,
    @FechaVenta = '2024-11-08',
    @Categoria = 'Promociones',
    @ReferenciaExterna = 'REF008',
    @CuentaID = 8,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 9
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta de licencias I',
    @Monto = 3500.00,
    @FechaVenta = '2024-11-09',
    @Categoria = 'Licencias',
    @ReferenciaExterna = 'REF009',
    @CuentaID = 9,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Registro de Venta 10
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroVentas
    @Descripcion = 'Venta internacional J',
    @Monto = 15000.00,
    @FechaVenta = '2024-11-10',
    @Categoria = 'Exportación',
    @ReferenciaExterna = 'REF010',
    @CuentaID = 10,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

------------------------------- Registro de gastos----------------------------

-- Gasto 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Pago de alquiler de oficina',
    @Monto = 1200.00,
    @FechaGasto = '2024-11-01',
    @Categoria = 'Alquiler',
    @ReferenciaExterna = 'GREF001',
    @CuentaID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Compra de materiales de oficina',
    @Monto = 350.75,
    @FechaGasto = '2024-11-02',
    @Categoria = 'Materiales',
    @ReferenciaExterna = 'GREF002',
    @CuentaID = 2,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Pago de servicios públicos',
    @Monto = 450.50,
    @FechaGasto = '2024-11-03',
    @Categoria = 'Servicios Públicos',
    @ReferenciaExterna = 'GREF003',
    @CuentaID = 3,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Pago de nómina',
    @Monto = 7500.00,
    @FechaGasto = '2024-11-04',
    @Categoria = 'Nómina',
    @ReferenciaExterna = 'GREF004',
    @CuentaID = 4,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 5
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Mantenimiento de equipos',
    @Monto = 200.00,
    @FechaGasto = '2024-11-05',
    @Categoria = 'Mantenimiento',
    @ReferenciaExterna = 'GREF005',
    @CuentaID = 5,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 6
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Gasto en publicidad digital',
    @Monto = 1250.00,
    @FechaGasto = '2024-11-06',
    @Categoria = 'Publicidad',
    @ReferenciaExterna = 'GREF006',
    @CuentaID = 6,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 7
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Pago de asesoría contable',
    @Monto = 800.00,
    @FechaGasto = '2024-11-07',
    @Categoria = 'Asesoría',
    @ReferenciaExterna = 'GREF007',
    @CuentaID = 7,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 8
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Compra de software de gestión',
    @Monto = 3000.00,
    @FechaGasto = '2024-11-08',
    @Categoria = 'Software',
    @ReferenciaExterna = 'GREF008',
    @CuentaID = 8,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 9
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Viajes de negocios',
    @Monto = 2500.00,
    @FechaGasto = '2024-11-09',
    @Categoria = 'Viajes',
    @ReferenciaExterna = 'GREF009',
    @CuentaID = 9,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Gasto 10
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarRegistroGastos
    @Descripcion = 'Compra de mobiliario de oficina',
    @Monto = 5000.00,
    @FechaGasto = '2024-11-10',
    @Categoria = 'Mobiliario',
    @ReferenciaExterna = 'GREF010',
    @CuentaID = 10,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go


------------------------------- Ordenes en produccion----------------------------

-- Orden de Producción 1
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Producción de Lotes de Productos A',
    @FechaInicio = '2024-11-01',
    @FechaFin = '2024-11-05',
    @CostoTotal = 15000.00,
    @MateriaPrima = 5000.00,
    @CuentaID = 1,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 2
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Fabricación de Equipos Electrónicos',
    @FechaInicio = '2024-11-02',
    @FechaFin = '2024-11-08',
    @CostoTotal = 30000.00,
    @MateriaPrima = 10000.00,
    @CuentaID = 2,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 3
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Producción de Muebles de Oficina',
    @FechaInicio = '2024-11-03',
    @FechaFin = '2024-11-10',
    @CostoTotal = 25000.00,
    @MateriaPrima = 8000.00,
    @CuentaID = 3,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 4
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Elaboración de Productos Químicos',
    @FechaInicio = '2024-11-04',
    @FechaFin = '2024-11-09',
    @CostoTotal = 40000.00,
    @MateriaPrima = 15000.00,
    @CuentaID = 4,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 5
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Montaje de Equipos Industriales',
    @FechaInicio = '2024-11-05',
    @FechaFin = '2024-11-15',
    @CostoTotal = 60000.00,
    @MateriaPrima = 20000.00,
    @CuentaID = 5,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 6
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Fabricación de Juguetes',
    @FechaInicio = '2024-11-06',
    @FechaFin = '2024-11-12',
    @CostoTotal = 18000.00,
    @MateriaPrima = 6000.00,
    @CuentaID = 6,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 7
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Producción de Ropa Deportiva',
    @FechaInicio = '2024-11-07',
    @FechaFin = '2024-11-14',
    @CostoTotal = 25000.00,
    @MateriaPrima = 7000.00,
    @CuentaID = 7,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 8
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Fabricación de Artículos de Cocina',
    @FechaInicio = '2024-11-08',
    @FechaFin = '2024-11-13',
    @CostoTotal = 20000.00,
    @MateriaPrima = 9000.00,
    @CuentaID = 8,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 9
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Producción de Productos Plásticos',
    @FechaInicio = '2024-11-09',
    @FechaFin = '2024-11-15',
    @CostoTotal = 35000.00,
    @MateriaPrima = 12000.00,
    @CuentaID = 9,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go

-- Orden de Producción 10
DECLARE @Resultado INT, @Mensaje NVARCHAR(500);
EXEC sp_RegistrarOrdenesProduccion
    @DescripcionOrden = 'Montaje de Sistemas Electrónicos',
    @FechaInicio = '2024-11-10',
    @FechaFin = '2024-11-20',
    @CostoTotal = 45000.00,
    @MateriaPrima = 18000.00,
    @CuentaID = 10,
    @Resultado = @Resultado OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;
Go
