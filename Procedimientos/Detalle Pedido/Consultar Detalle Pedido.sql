/*Procedimiento para consultar el detalle de un pedido*/
use scliz;

delimiter $$
drop procedure if exists consultarDetallePedido $$
create procedure consultarDetallePedido(
	in pNumeroPedido int
)
begin
	select
	d.pkIdDetallePedido,
	d.cantidadProductoDetallePedido,
    d.valorTotalDetallePedido,
    d.valorGananciaDetallePedido,
    d.valorProductoDetallePedido,
    d.valorGananciaProductoDetallePedido,
    d.valorProductoProveedor,
    n.nombreProducto,
    m.nombreMarcaProducto,
    de.nombreDescripcionProducto
    from nombreProducto as n
    inner join producto as p on n.pkIdNombreProducto = p.fkIdNombreProducto
    inner join marcaProducto as m on m.pkIdMarcaProducto = p.fkIdMarcaProducto
    inner join descripcionProducto as de on de.pkIdDescripcionProducto = p.fkIdDescripcionProducto
    inner join detallePedido as d on p.pkIdProducto = d.fkIdProducto
    inner join pedido as pe on pe.pkNumeroPedido = d.fkNumeroPedido 
    where pe.pkNumeroPedido = pNumeroPedido;
end $$
delimiter ;