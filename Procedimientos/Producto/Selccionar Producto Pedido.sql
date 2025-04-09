/*Procedimiento para seleccionar un producto para un pedido*/
use scliz;

delimiter $$
drop procedure if exists seleccionarProductoPedido $$
create procedure seleccionarProductoPedido(
	in pIdProducto int
)
begin
	select
		p.pkIdProducto,
        p.precioUnitarioProducto
        from producto as p
        where p.pkIdProducto = pIdProducto;
end $$
delimiter ;