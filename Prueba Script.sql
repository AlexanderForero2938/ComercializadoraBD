use scliz;

select registrarEmpresa("4567654345", "Empresa 1", "3234567898", "Calle 1");

select registrarEmpresa("4567654355", "Empresa 2", "7678987645", "Calle 2");

select registrarEmpresa("1234565443", "Empresa 3", "3232323232", "Call 3");

select registrarEmpresa("9999999999", "Empresa 4", "8789098765", "Calle 4");

select registrarEmpresa("9949999999", "Empresa 5", "8789099765", "Calle 5");

select registrarPersona("Alexander", null, "Moreno", "Cuenca", 17650996, 1);

select registrarPersona("Jhon", "Alexander", "Moreno", "Forero", 176509966, 1);

call registrarUsuario("17650996", "17650996");

call registrarUsuario("176509966", "176509966");

call consultarUsuario("17650996");

select modificarContrasenaUsuario("17650996", "17650996", "1117546716", "1117546716");

select registrarRol("Gerente");

select registrarRol("Empleado");

select registrarGerente(1, 1, 1);

call consultarGerente(17650996);

call modificarGerente("17650996", "inactivo");

select registrarEmpleado("3118000810", 2, 2, 2);

select * from listarEmpleados;

call consultarEmpleado(176509966);

call modificarEmpleado(176509966, "inactivo", "3053956070", 2);

call modificarEmpleadoCuenta(176509966, "3046236817");

call consultarRol(1);

select * from listarRoles;

select modificarRol(1, "gerente", "inactivo");

select registrarCliente("empresa1@gmail.com", 1);

select registrarCliente("empresa2@gmail.com", 2);

select registrarCliente("empresa3@gmail.com", 3);

select * from listarClientes;

call modificarCliente("4567654345", "inactivo", "empresa1@gmail.com");

call consultarCliente("4567654345", null);

call consultarCliente(null, "empresa 1");

select registrarFactura(1, 2, 1);

select * from listarFacturas;

call consultarFactura("4567654345");

call modificarValorFactura(1, 430000);

call filtrarFactura('Empresa 1', null, null);

call modificarEstadoFactura(1);

select registrarProveedor(4);

select registrarProveedor(5);

select * from listarProveedores;

call modificarProveedor("9949999999", "calle 9", "1111111111", "inactivo");

call consultarProveedor("9949999999", null);

select registrarPedido(1, 1);

select registrarPedido(1, 2);

call modificarFechaLlegadaPedido(1, '2025-05-08');

call modificarValorPedido(1, 5000000);

call consultarPedido("9999999999", null);

select * from listarPedidos;

call modificarEstadoPedido(1);

call filtrarPedido("empresa 4", null, null);

select * from listarPermisos;

call consultarPermiso(2);

select modificarEstadoPermiso(2, "inactivo");

select registrarRolPermiso(1, 1);

select * from listarRolesPermisos;

select modificarEstadoRolPermiso(1, "inactivo");

call consultarRolPermiso(1);

call filtrarRolPermiso("empleado");

select registrarProducto(2000, 2500, 1, 1, 1, 1);

select * from listarProductos;

call filtrarProducto("lapiz", null, null);

select modificarPrecioProducto(1, 1500, 2000);

call consultarProducto(1);

select descontarStockProducto(1, 10);

call aumentarStockProducto(1, 50);

call registrarDetallePedido(1, 1, 10, 20000, 500, 2000, 2500, 5000);

call modificarDetallePedido(2, 20, 40000, 10000);

call consultarDetallePedido(1);

call eliminarDetallePedido(3);

call registrarDetalleFactura(1, 1, 5, 1500, 0, 7500, 0);

call modificarDetalleFactura(2, 10, 0, 15000);

call consultarDetalleFactura(1);

select crearInventario(null);

select modificarInventario(1, '2025-05-08');

select * from listarInventarios;

call consultarInventario(1);

call consultarDetalleInventario(1);