/*Procedimiento para modificar el estado de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarEstadoPedido $$
create procedure modificarEstadoPedido(
	in pNumeroPedido int
)
begin
	update pedido
		set pedido.estadoPedido = "ENTREGADO"
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;