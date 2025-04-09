/*Procedimiento para modificar el valor de una factura*/
use scliz;

delimiter $$
drop procedure if exists modificarValorFactura $$
create procedure modificarValorFactura(
	pNumeroFactura int,
    pNuevoValorTotalFactura decimal(10,2)
)
begin    
    update factura
		set factura.valorTotalFactura = pNuevoValorTotalFactura
		where factura.pkNumeroFactura = pNumeroFactura;
end $$
delimiter ;