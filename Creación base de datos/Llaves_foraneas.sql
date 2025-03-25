use comercializadora;

alter table rolPermiso add constraint fkPermiso foreign key(fkIdPermiso) references permiso(pkIdPermiso);

alter table rolPermiso add constraint fkRol foreign key(fkIdRol) references rol(pkIdRol);

alter table usuario add constraint fkUsuarioPersona foreign key(fkIdPersona) references persona(pkIdPersona);

alter table usuario add constraint fkUsuarioRol foreign key(fkIdRol) references rol(pkIdRol);

alter table persona add constraint fkTipoIdentificacion foreign key(fkIdTipoIdentificacion) references tipoIdentificacion(pkIdTipoIdentificacion);

alter table empleado add constraint fkEmpleadoPersona foreign key(fkIdPersona) references persona(pkIdPersona);

alter table empleado add constraint fkGerentePersona foreign key(fkIdPersona) references persona(pkIdPersona);

alter table factura add constraint fkFacturaEmpleado foreign key(fkIdEmpleado) references empleado(pkIdEmpleado);

alter table factura add constraint fkMetodoPago foreign key(fkIdMetodoPago) references metodoPago(pkIdMetodoPago);

alter table factura add constraint fkFacturaCliente foreign key(fkIdCliente) references cliente(pkIdCliente);

alter table cliente add constraint fkClienteEmpresa foreign key(fkIdEmpresa) references empresa(pkIdEmpresa);

alter table proveedor add constraint fkProveedorEmpresa foreign key(fkIdEmpresa) references empresa(pkIdEmpresa);

alter table detalleFactura add constraint fkFactura foreign key(fkNumeroFactura) references factura(pkIdNumeroFactura);

alter table detalleFactura add constraint fkDetalleFacturaProducto foreign key(fkIdProducto) references producto(pkIdProducto);

alter table pedido add constraint fkPedidoGerente foreign key(fkIdGerente) references gerente(pkIdGerente);

alter table pedidoProducto add constraint fkNumeroPedido foreign key(fkNumeroPedido) references pedido(pkNumeroPedido);

alter table pedidoProducto add constraint fkProducto foreign key(fkIdProducto) references producto(pkIdProducto);

alter table pedidoProducto add constraint fkProveedor foreign key(fkIdProveedor) references proveedor(pkIdProveedor);

alter table producto add constraint fkIVA foreign key(fkIdIVA) references iva(pkIdIVA);

alter table producto add constraint fkNombreProducto foreign key(fkIdNombreProducto) references nombreProducto(pkIdNombreProducto);

alter table producto add constraint fkDescripcionProducto foreign key(fkIdDescripcionProducto) references descripcionProducto(pkIdDescripcionProducto);

alter table producto add constraint fkMarcaProducto foreign key(fkIdMarcaProducto) references marcaProducto(pkIdMarcaProducto);

alter table detalleInventario add constraint fkDetalleInventarioProducto foreign key(fkIdProducto) references producto(pkIdProducto);

alter table detalleInventario add constraint fkInventario foreign key(fkNumeroInventario) references inventario(pkNumeroInventario);

alter table detalleInventario add constraint fkMovimientoInventario foreign key(fkIdMovimientoInventario) references movimientoInventario(pkIdMovimientoInventario);