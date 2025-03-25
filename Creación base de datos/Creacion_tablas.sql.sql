create database comercializadora;

use comercializadora;

create table permiso(
pkIdPermiso int not null primary key,
nombrePermiso varchar(20) not null unique,
estadoPermiso varchar(10) not null
);

create table rolPermiso(
pkIdRolPermiso int not null primary key,
estadoRolPermiso varchar(10) not null,
fkIdRol int not null,
fkIdPermiso int not null
);

create table rol(
pkIdRol int not null primary key,
nombreRol varchar(20) not null unique,
estadoRol varchar(10) not null
);

create table usuario(
pkIdUsuario int not null primary key,
nombreUsuario varchar(20) not null unique,
contrasenaUsuario varchar(10) not null,
estadoUsuario varchar(10) not null,
fkIdPersona int not null unique,
fkIdRol int not null
);

create table persona(
pkIdPersona int not null primary key,
primerNombrePersona varchar(45) not null,
segundoNombrePersona varchar(45) null,
primerApellidoPersona varchar(45) not null,
segundoApellidoPersona varchar(45) null,
numeroIdentificacionPersona int not null unique,
estadoPersona varchar(10) not null,
fkIdTipoIdentificacion int not null
);

create table tipoIdentificacion(
pkIdTipoIdentificacion int not null primary key,
nombreTipoIdentificacion varchar(20) not null unique,
estadoTipoIdentificacion varchar(10) not null
);

create table empleado(
pkIdEmpleado int not null primary key,
numeroContactoEmpleado varchar(10) not null unique,
estadoEmpleado varchar(10) not null,
fkIdPersona int not null unique
);

create table gerente(
pkIdGerente int not null primary key,
estadoGerente varchar(10) not null,
fkIdPersona int not null unique
);

create table factura(
pkIdNumeroFactura int not null primary key,
fechaCreacionFactura date not null,
horaCreacionFactura time not null,
valorTotalFactura decimal(10,2) not null,
estadoFactura varchar(10) not null,
fkIdEmpleado int not null,
fkIdMetodoPago int not null,
fkIdCliente int not null
);

create table metodoPago(
pkIdMetodoPago int not null primary key,
nombreMetodoPago varchar(20) not null unique,
estadoMetodoPago varchar(10) not null
);

create table cliente(
pkIdCliente int not null primary key,
correoElectronicoCliente varchar(50) not null unique,
estadoCliente varchar(10) not null,
fkIdEmpresa int not null unique
);

create table empresa(
pkIdEmpresa int not null primary key,
NITEmpresa varchar(10) not null unique,
nombreEmpresa varchar(50) not null unique,
numeroContactoEmpresa varchar(10) not null unique,
direccionEmpresa varchar(50) not null unique,
estadoEmpresa varchar(10) not null
);

create table proveedor(
pkIdProveedor int not null primary key,
estadoProveedor varchar(10) not null,
fkIdEmpresa int not null unique
);

create table detalleFactura(
pkIdDetalleFactura int not null primary key,
cantidadProducto int not null,
valorTotalDetalleFactura decimal(10,2) not null,
estadoDetalleFactura varchar(10) not null,
fkNumeroFactura int not null,
fkIdProducto int not null
);

create table pedido(
pkNumeroPedido int not null primary key,
fechaRealizoPedido date not null,
fechaLlegadaPedido date not null,
valorTotalPedido decimal(10,2) not null,
estadoPedido varchar(10) not null,
fkIdGerente int not null
);

create table pedidoProducto(
pkNumeroPedidoProducto int not null primary key,
cantidadProducto int not null,
valorUnitarioProducto decimal(10, 2) not null,
valorGananciaProducto decimal(10, 2) not null,
estadoPedidoProducto varchar(10) not null,
fkNumeroPedido int not null,
fkIdProducto int not null,
fkIdProveedor int not null
);

create table nombreProducto(
pkIdNombreProducto int not null primary key,
nombreProducto varchar(20) not null unique,
estadoNombreProducto varchar(10) not null
);

create table descripcionProducto(
pkIdDescripcionProducto int not null primary key,
nombreDescripcionProducto varchar(20) not null unique,
estadoDescripcionProducto varchar(10) not null
);

create table marcaProducto(
pkIdMarcaProducto int not null primary key,
nombreMarcaProducto varchar(20) not null unique,
estadoMarcaProducto varchar(10) not null
);

create table producto(
pkIdProducto int not null primary key,
cantidadStock int not null,
precioUnitarioProductoSinIVA decimal(10,2) not null,
precioUnitarioProductoConIVA decimal(10,2) not null,
estadoProducto varchar(10) not null,
fkIdIVA int not null,
fkIdNombreProducto int not null,
fkIdDescripcionProducto int not null,
fkIdMarcaProducto int not null
);

create table iva(
pkIdIVA int not null primary key,
valorIVA int not null unique,
estadoIVA varchar(10) not null
);

create table detalleInventario(
pkIdDetalleInventario int not null primary key,
cantidadProducto int not null,
fechaMovimimento date not null,
estadoDetalleInventario varchar(10) not null,
fkIdProducto int not null,
fkNumeroInventario int not null,
fkIdMovimientoInventario int not null
);

create table movimientoInventario(
pkIdMovimientoInventario int not null primary key,
nombreMovimientoInventario varchar(10) not null unique,
estadoMovimientoInventario varchar(10) not null
);

create table inventario(
pkNumeroInventario int not null primary key,
fechaAbiertoInventario date not null unique,
fechaCierreInventario date not null,
valorTotalInventario decimal(10, 2) not null,
estadoInventario varchar(10) not null
);