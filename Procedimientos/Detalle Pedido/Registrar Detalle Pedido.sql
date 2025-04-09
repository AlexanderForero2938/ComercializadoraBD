/*Procedimiento para registrar un detalle pedido*/
use scliz;

delimiter $$
drop procedure if exists registrarDetallePedido $$
create procedure registrarDetallePedido(
	in pNumeroPedido int,
    in pIdProducto int,
    in pCantidadProductoDetallePedido int,
    in pValorTotalDetallePedido decimal(10,2),
    in pValorGananciaDetallePedido decimal(10,2),
    in pValorProductoDetallePedido decimal(10,2),
    in pValorProductoProveedor decimal(10,2),
    in pValorGananciaProductoDetallePedido decimal(10,2)
)
begin
	insert into detallePedido(
			cantidadProductoDetallePedido,
            valorTotalDetallePedido,
            valorGananciaDetallePedido,
            valorProductoDetallePedido,
            valorGananciaProductoDetallePedido,
            valorProductoProveedor,
            estadoDetallePedido,
            fkNumeroPedido,
            fkIdProducto
            )
            values(
            pCantidadProductoDetallePedido,
            pValorTotalDetallePedido,
            pValorGananciaDetallePedido,
            pValorProductoDetallePedido,
            pValorProductoProveedor,
			pValorGananciaProductoDetallePedido,
            "REGISTRADO",
            pNumeroPedido,
            pIdProducto
            );
end $$
delimiter ;