/*Procedimiento para modificar la fecha de llegada de un pedido*/
use comercializadora;

delimiter $$
drop procedure if exists modificarPedidoFechaLlegada $$
create procedure modificarPedidoFechaLlegada(
	in pNumeroPedido int,
    in fechaLlegadaPedido char(10)
)
begin
	update pedido
		set pedido.fechaLlegadaPedido = str_to_date(fechaLlegadaPedido, '%Y-%m-%d')
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;