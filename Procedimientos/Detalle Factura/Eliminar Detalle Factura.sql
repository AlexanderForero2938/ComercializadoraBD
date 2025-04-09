/*Procedimiento para eliminar el detalle de una factura*/
use scliz;

delimiter $$
drop procedure if exists eliminarDetalleFactura $$
create procedure eliminarDetalleFactura(
	in pIdDetalleFactura int
)
begin
	delete from detalleFactura
    where detalleFactura.pkIdDetalleFactura = pIdDetalleFactura;
end $$
delimiter ;