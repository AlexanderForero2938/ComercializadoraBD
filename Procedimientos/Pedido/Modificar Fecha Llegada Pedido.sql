/*Procedimiento para modificar la fecha de llegada de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarFechaLlegadaPedido $$
create procedure modificarFechaLlegadaPedido(
	in pNumeroPedido int,
    in pNuevaFechaLlegadaPedido date
)
begin
	update pedido
		set pedido.fechaLlegadaPedido = pNuevaFechaLlegadaPedido
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;