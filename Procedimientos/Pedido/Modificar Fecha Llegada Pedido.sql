/*Procedimiento para modificar la fecha de llegada de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarPedidoFechaLlegada $$
create procedure modificarPedidoFechaLlegada(
	in pNumeroPedido int,
    in fechaLlegadaPedido date
)
begin
	update pedido
		set pedido.fechaLlegadaPedido = fechaLlegadaPedido
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;