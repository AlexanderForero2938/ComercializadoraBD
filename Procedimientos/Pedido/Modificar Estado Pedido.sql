/*Procedimiento para modificar el estado de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarPedidoEstado $$
create procedure modificarPedidoEstado(
	in pNumeroPedido int,
    in pNuevoEstado varchar(10)
)
begin
	update pedido
		set pedido.estadoPedido = upper(pNuevoEstado)
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;