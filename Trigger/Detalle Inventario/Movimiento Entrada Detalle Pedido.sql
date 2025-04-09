/*Trigger para capturar el movimiento de entrada del producto en el detalle del inventario*/
use scliz;

delimiter $$
drop trigger if exists movimientoEntradaProducto $$
create trigger movimientoEntradaProducto
after insert on detallePedido
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
			new.cantidadProductoDetallePedido,
            curdate(),
            new.valorTotalDetallePedido,
            new.valorProductoProveedor,
            "REGISTRADO",
            2,
            new.fkIdProducto,
            idInventarioActivo
            );
end $$
delimiter ;            