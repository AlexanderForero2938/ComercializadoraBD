/*Procedimiento para eliminar el detalle de un pedido*/
use scliz;

delimiter $$
drop procedure if exists eliminarDetallePedido $$
create procedure eliminarDetallePedido(
	in pIdDetallePedido int
)
begin
	delete from detallePedido
    where detallePedido.pkIdDetallePedido = pIdDetallePedido;
end $$
delimiter ;