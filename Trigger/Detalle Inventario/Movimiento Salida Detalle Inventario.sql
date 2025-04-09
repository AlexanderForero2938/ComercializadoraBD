/*Trigger para capturar el movimiento de salida del producto en el detalle del inventario*/
use scliz;

delimiter $$
drop trigger if exists movimientoSalidaProducto $$
create trigger movimientoSalidaProducto
after insert on detalleFactura
for each row
begin
	declare idInventarioActivo int;
    
    select i.pkNumeroInventario
    into idInventarioActivo
    from inventario as i
    where i.estadoInventario = "ABIERTO";

	insert into detalleInventario(
			cantidadProducto,
            fechaMovimientoDetalleInventario,
            valorDetalleInventario,
            valorUnitarioProductoDetalleInventario,
            estadoDetalleInventario,
            fkIdMovimientoInventario,
            fkIdProducto,
            fkNumeroInventario
            )
			values(
			new.cantidadProductoDetalleFactura,
            curdate(),
            new.valorTotalDetalleFacturaIVA,
            new.precioUnitarioProductoSinIVA,
            "REGISTRADO",
            2,
            new.fkIdProducto,
            idInventarioActivo
            );
end $$
delimiter ;            