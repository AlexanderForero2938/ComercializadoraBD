/*Procedimiento para consultar el detalle de una factura*/
use scliz;

delimiter $$
drop procedure if exists consultarDetalleFactura $$
create procedure consultarDetalleFactura(
	in pNumeroFactura int
)
begin
	select
	d.pkIdDetalleFactura,
    d.cantidadProductoDetalleFactura,
    d.precioUnitarioProductoSinIVA,
    d.valorIVAProductoDetalleFactura,
    d.valorTotalDetalleFacturaIVA,
    d.valorIVA,
    n.nombreProducto,
    m.nombreMarcaProducto,
    de.nombreDescripcionProducto
    from nombreProducto as n
    inner join producto as p on n.pkIdNombreProducto = p.fkIdNombreProducto
    inner join marcaProducto as m on m.pkIdMarcaProducto = p.fkIdMarcaProducto
    inner join descripcionProducto as de on de.pkIdDescripcionProducto = p.fkIdDescripcionProducto
    inner join detalleFactura as d on p.pkIdProducto = d.fkIdProducto
    inner join factura as f on f.pkNumeroFactura = d.fkNumeroFactura 
    where f.pkNumeroFactura = pNumeroFactura;
end $$
delimiter ;