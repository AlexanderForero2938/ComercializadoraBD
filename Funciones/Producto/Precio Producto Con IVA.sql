/*Función para poner el valor del producto mas el IVA*/
use comercializadora;

delimiter $$
drop function if exists precioProductoIVA $$
create function precioProductoIVA(
	pValorProducto decimal(10,2),
    pValorIVA int
)
returns decimal(10,2)
deterministic
begin
declare valorProductoConIVA decimal(10,2);
	
    set valorProductoConIVA = pValorProducto + ((pValorProducto / 100) *  pValorIVA);
	return  valorProductoConIVA;
    
end $$
delimiter ;