/*Procedimiento para modificar el estado de una factura*/
use scliz;

delimiter $$
drop procedure if exists modificarEstadoFactura $$
create procedure modificarEstadoFactura(
	pNumeroFactura int
)
begin    
    update factura
		set factura.estadoFactura = 'REGISTRADA'
		where factura.pkNumeroFactura = pNumeroFactura;
end $$
delimiter ;