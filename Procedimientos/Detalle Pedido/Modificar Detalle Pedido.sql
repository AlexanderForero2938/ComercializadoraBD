/*Procedimiento para modificar el detalle de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarDetallePedido$$
create procedure modificarDetallePedido(
	in pIdDetalleFactura int,
    in pNuevaCantidadProductoDetallePedido int,
    in pNuevoValorTotalDetallePedido decimal(10,2),
    in pNuevoValorGananciaProductoDetallePedido decimal(10,2)
    )
begin
	update detallePedido
		set detallePedido.cantidadProductoDetallePedido = pNuevaCantidadProductoDetallePedido,
			detallePedido.valorTotalDetallePedido = pNuevoValorTotalDetallePedido,
            detallePedido.valorGananciaProductoDetallePedido = pNuevoValorGananciaProductoDetallePedido
		where detallePedido.pkIdDetallePedido = pIdDetalleFactura;
end $$
delimiter ;