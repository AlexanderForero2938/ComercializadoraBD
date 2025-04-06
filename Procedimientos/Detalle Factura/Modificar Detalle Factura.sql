/*Procedimiento para modificar el detalle de una factura*/
use scliz;

delimiter $$
drop procedure if exists modificarDetalleFactura $$
create procedure modificarDetalleFactura(
	in pIdDetalleFactura int,
    in pNuevaCantidadProductoDetalleFactura int,
    in pNuevoValorTotalDetalleFactura decimal(10,2)
)
begin
	update detalleFactura
		set detalleFactura.cantidadProductoDetalleFactura = pNuevaCantidadProductoDetalleFactura,
			detalleFactura.valorTotalDetalleFactura = pNuevoValorTotalDetalleFactura
		where detalleFactura.pkIdDetalleFactura = pIdDetalleFactura;
end$$
delimiter ;