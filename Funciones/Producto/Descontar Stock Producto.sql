/*Función para descontar el stock de un producto*/
use scliz;

delimiter $$
drop function if exists descontarStockProducto;  $$
create function descontarStockProducto(
	pIdProducto int,
	pCantidadProductoDescontar int
	)
returns varchar (100)
deterministic
begin
	declare stockActualProducto int;
    
    select p.cantidadStock
    into stockActualProducto
    from producto as p
    where p.pkIdProducto = pIdProducto;
        
	if stockActualProducto < pCantidadProductoDescontar then
		return "La cantidad a comprar es superior al stock actual del producto";
	else
		update producto
			set producto.cantidadStock = stockActualProducto - pCantidadProductoDescontar
		where producto.pkIdProducto = pIdProducto;
        return "";
	end if;
end$$
delimiter ;