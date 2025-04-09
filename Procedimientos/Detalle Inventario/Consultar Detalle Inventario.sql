/*Procedimiento para consultar el detalle de un inventario*/
use scliz;

delimiter $$
drop procedure if exists consultarDetalleInventario $$
create procedure consultarDetalleInventario(
	in pNumeroInventario int
)
begin
	select
		d.cantidadProducto,
        d.fechaMovimientoDetalleInventario,
        d.valorDetalleInventario,
        d.valorUnitarioProductoDetalleInventario,
        m.nombreMovimientoInventario,
        n.nombreProducto,
        de.nombreDescripcionProducto,
        ma.nombreMarcaProducto
        from producto as p
        inner join nombreProducto as n on n.pkIdNombreProducto = p.fkIdNombreProducto
        inner join marcaProducto as ma on ma.pkIdMarcaProducto = p.fkIdMarcaProducto
        inner join descripcionProducto as de on de.pkIdDescripcionProducto = p.fkIdDescripcionProducto
        inner join detalleInventario as d on p.pkIdProducto = d.fkIdProducto
        inner join movimientoInventario as m on m.pkIdMovimientoInventario = d.fkIdMovimientoInventario
        inner join inventario as i on i.pkNumeroInventario = d.fkNumeroInventario
        where i.pkNumeroInventario = pNumeroInventario;
end $$
delimiter ;