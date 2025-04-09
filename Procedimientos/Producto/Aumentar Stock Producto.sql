/*Función para aumentar el stock de un producto*/
use scliz;

delimiter $$
drop procedure if exists aumentarStockProducto;  $$
create procedure aumentarStockProducto(
	pIdProducto int,
	pCantidadProductoAumentar int
	)
begin
	update producto
		set producto.cantidadStock = cantidadStock + pCantidadProductoAumentar
	where producto.pkIdProducto = pIdProducto;
end$$
delimiter ;