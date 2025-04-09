/*Procedimiento para modificar el valor total de un pedido*/
use scliz;

delimiter $$
drop procedure if exists modificarValorPedido $$
create procedure modificarValorPedido(
	in pNumeroPedido int,
    in pNuevoValorTotalPedido decimal(10,2)
)
begin
	update pedido
		set pedido.valorTotalPedido = pNuevoValorTotalPedido
		where pedido.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;