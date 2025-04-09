/*Procedimiento para modificar un producto registrado en el sistema*/
use scliz;

delimiter $$
drop function if exists modificarPrecioProducto $$
create function modificarPrecioProducto(
	pIdProducto int,
    pNuevoPrecioUnitarioProductoSinIVA decimal(10,2),
    pNuevoPrecioUnitarioProductoConIVA decimal(10,2)
)
returns varchar (100)
deterministic
begin            
	update producto
    set producto.precioUnitarioProductoSinIVA = pNuevoPrecioUnitarioProductoSinIVA,
		producto.precioUnitarioProductoConIVA = pNuevoPrecioUnitarioProductoConIVA
	where producto.pkIdProducto = pIdProducto;
    
    return "Se modifico el precio del producto";
end $$
delimiter ;