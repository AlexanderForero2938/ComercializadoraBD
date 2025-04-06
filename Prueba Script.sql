use scliz;

select registrarEmpresa("4567654345", "Empresa 1", "3234567898", "Calle 1");

select registrarProveedor(1);

call modificarProveedor("4567654345", "Calle 2", "3234567898", "ACTIVO");

call consultarProveedor(null, "Empresa 1");

select registrarPersona("Alexander", null, "Moreno", "Cuenca", 17650996, 1);

call registrarUsuario("17650996", "17650996");

select registrarGerente(1, 1, 1);

call modificarGerente(17650996, "inactivo");

call consultarGerente(17650996);

select registrarPedido('2025-04-05', 2000, 1, 1);

call modificarPedidoFechaLlegada(1, '2025-04-07');
