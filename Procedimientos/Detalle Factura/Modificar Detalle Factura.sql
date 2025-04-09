/*Procedimiento para modificar el detalle de una factura*/
use scliz;

delimiter $$
drop procedure if exists modificarDetalleFactura$$
create procedure modificarDetalleFactura(
	in pIdDetalleFactura int,
    in pNuevaCantidadProductoDetalleFactura int,
    in pNuevoValorIVAProductoDetalleFactura decimal(10,2),
    in pNuevoValorTotalDetalleFacturaIVA decimal(10,2)
    )
begin
	update detalleFactura
		set detalleFactura.cantidadProductoDetalleFactura = pNuevaCantidadProductoDetalleFactura,
			detalleFactura.valorIVAProductoDetalleFactura = pNuevoValorIVAProductoDetalleFactura,
            detalleFactura.valorTotalDetalleFacturaIVA = pNuevoValorTotalDetalleFacturaIVA
		where detalleFactura.pkIdDetalleFactura = pIdDetalleFactura;
end $$
delimiter ;