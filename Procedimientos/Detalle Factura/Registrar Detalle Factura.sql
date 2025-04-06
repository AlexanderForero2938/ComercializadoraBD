/*Procedimiento para registrar un detalle factura*/
use scilz;

delimiter $$
drop procedure if exists registrarDetalleFactura $$
create procedure registrarDetalleFactura(
	in pCantidadProductoDetalleFactura int,
    in pValorTotalDetalleFactura decimal(10,2),
    in pIdNumeroFactura int,
    in pIdProducto int
)
begin
	insert into detalleFactura(
			cantidadProductoDetalleFactura,
            valorTotalDetalleFactura,
            estadoDetalleFactura,
            fkIdNumeroFactura,
            fkIdProducto
            )
            values(
            pCantidadProductoDetalleFactura,
            pValorTotalDetalleFactura,
            'ACTIVO',
            pIdNumeroFactura,
            pIdProducto
            );
end$$
delimiter ;