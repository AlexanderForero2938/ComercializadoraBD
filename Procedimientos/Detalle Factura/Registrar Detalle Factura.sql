/*Procedimiento para registrar un detalle factura*/
use scliz;

delimiter $$
drop procedure if exists registrarDetalleFactura $$
create procedure registrarDetalleFactura(
	in pNumeroFactura int,
    in pIdProducto int,
    in pCantidadProductoDetalleFactura int,
    in pPrecioUnitarioProductoSinIVA decimal(10,2),
    in pValorIVAProductoDetalleFactura int,
    in pValorTotalDetalleFacturaIVA decimal(10,2),
    in pValorIVA int
)
begin
	insert into detalleFactura(
			cantidadProductoDetalleFactura,
			precioUnitarioProductoSinIVA,
            valorIVAProductoDetalleFactura,
            valorTotalDetalleFacturaIVa,
            valorIVA,
            estadoDetalleFactura,
            fkNumeroFactura,
            fkIdProducto
            )
            values(
            pCantidadProductoDetalleFactura,
            pPrecioUnitarioProductoSinIVA,
            pValorIVAProductoDetalleFactura,
            pValorTotalDetalleFacturaIVA,
            pValorIVA,
            "REGISTRADO",
            pNumeroFactura,
            pIdProducto
            );
end $$
delimiter ;