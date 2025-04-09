create database SCLiz;

use SCLiz;

create table permiso(
pkIdPermiso int not null primary key auto_increment,
codigoPermiso varchar(100) not null unique,
nombrePermiso varchar(100) not null unique,
estadoPermiso varchar(10) not null
);

create table rolPermiso(
pkIdRolPermiso int not null primary key auto_increment,
estadoRolPermiso varchar(10) not null,
fkIdRol int not null,
fkIdPermiso int not null
);

create table rol(
pkIdRol int not null primary key auto_increment,
nombreRol varchar(20) not null unique,
estadoRol varchar(10) not null
);

create table usuario(
pkIdUsuario int not null primary key auto_increment,
nombreUsuario varchar(20) not null unique,
contrasenaUsuario varchar(10) not null,
estadoUsuario varchar(10) not null
);

create table persona(
pkIdPersona int not null primary key auto_increment,
primerNombrePersona varchar(45) not null,
segundoNombrePersona varchar(45) null,
primerApellidoPersona varchar(45) not null,
segundoApellidoPersona varchar(45) null,
numeroIdentificacionPersona int not null unique,
estadoPersona varchar(10) not null,
fkIdTipoIdentificacion int not null
);

create table tipoIdentificacion(
pkIdTipoIdentificacion int not null primary key auto_increment,
nombreTipoIdentificacion varchar(20) not null unique,
estadoTipoIdentificacion varchar(10) not null
);

create table empleado(
pkIdEmpleado int not null primary key auto_increment,
numeroContactoEmpleado varchar(10) not null unique,
estadoEmpleado varchar(10) not null,
fkIdPersona int not null unique,
fkIdUsuario int null unique,
fkIdRol int not null
);

create table gerente(
pkIdGerente int not null primary key auto_increment,
estadoGerente varchar(10) not null,
fkIdPersona int not null unique,
fkIdUsuario int null unique,
fkIdRol int not null
);

create table factura(
pkNumeroFactura int not null primary key auto_increment,
fechaCreacionFactura date not null,
horaCreacionFactura time not null,
valorTotalFactura decimal(10,2) not null,
estadoFactura varchar(10) not null,
fkIdEmpleado int not null,
fkIdMetodoPago int not null,
fkIdCliente int not null
);

create table metodoPago(
pkIdMetodoPago int not null primary key auto_increment,
nombreMetodoPago varchar(20) not null unique,
estadoMetodoPago varchar(10) not null
);

create table cliente(
pkIdCliente int not null primary key auto_increment,
correoElectronicoCliente varchar(50) not null unique,
estadoCliente varchar(10) not null,
fkIdEmpresa int not null unique
);

create table empresa(
pkIdEmpresa int not null primary key auto_increment,
NITEmpresa varchar(10) not null unique,
nombreEmpresa varchar(50) not null unique,
numeroContactoEmpresa varchar(10) not null unique,
direccionEmpresa varchar(50) not null unique,
estadoEmpresa varchar(10) not null
);

create table proveedor(
pkIdProveedor int not null primary key auto_increment,
estadoProveedor varchar(10) not null,
fkIdEmpresa int not null unique
);

create table detalleFactura(
pkIdDetalleFactura int not null primary key auto_increment,
cantidadProductoDetalleFactura int not null,
valorTotalDetalleIVA decimal(10,2) not null,
valorDetalleFacturaSinIVA decimal(10,2) not null,
valorProductoDetalleFactura decimal(10,2) not null,
estadoDetalleFactura varchar(10) not null,
fkNumeroFactura int not null,
fkIdProducto int not null
);

create table pedido(
pkNumeroPedido int not null primary key auto_increment,
fechaRealizoPedido date not null,
fechaLlegadaPedido date null,
valorTotalPedido decimal(10,2) null,
estadoPedido varchar(10) not null,
fkIdGerente int not null,
fkIdProveedor int not null
);

create table detallePedido(
pkIdDetallePedido int not null primary key auto_increment,
cantidadProductoDetallePedido int not null,
valorTotalDetallePedido decimal(10, 2) not null,
valorGananciaDetallePedido decimal(10, 2) not null,
valorProductoDetallePedido decimal(10,2) not null,
valorGananciaProductoDetallePedido decimal(10,2) not null,
valorProductoProveedor decimal(10,2) not null,
estadoDetallePedido varchar(10) not null,
fkNumeroPedido int not null,
fkIdProducto int not null
);

create table nombreProducto(
pkIdNombreProducto int not null primary key auto_increment,
nombreProducto varchar(20) not null unique,
estadoNombreProducto varchar(10) not null
);

create table descripcionProducto(
pkIdDescripcionProducto int not null primary key auto_increment,
nombreDescripcionProducto varchar(20) not null unique,
estadoDescripcionProducto varchar(10) not null
);

create table marcaProducto(
pkIdMarcaProducto int not null primary key auto_increment,
nombreMarcaProducto varchar(20) not null unique,
estadoMarcaProducto varchar(10) not null
);

create table producto(
pkIdProducto int not null primary key auto_increment,
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
pkIdIVA int not null primary key auto_increment,
valorIVA int not null unique,
estadoIVA varchar(10) not null
);

create table detalleInventario(
pkIdDetalleInventario int not null primary key auto_increment,
cantidadProducto int not null,
fechaMovimientoDetalleInventario date not null,
valorDetalleInventario decimal(10,2) not null,
valorUnitarioProductoDetalleInventario decimal(10,2) not null,
estadoDetalleInventario varchar(10) not null,
fkIdProducto int not null,
fkNumeroInventario int not null,
fkIdMovimientoInventario int not null
);

create table movimientoInventario(
pkIdMovimientoInventario int not null primary key auto_increment,
nombreMovimientoInventario varchar(10) not null unique,
estadoMovimientoInventario varchar(10) not null
);

create table inventario(
pkNumeroInventario int not null primary key auto_increment,
fechaAbiertoInventario date not null unique,
fechaCierreInventario date not null,
valorTotalInventario decimal(10, 2) not null,
estadoInventario varchar(10) not null
);