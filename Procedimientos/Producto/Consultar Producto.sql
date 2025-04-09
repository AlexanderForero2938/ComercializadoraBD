/*Procedimiento para consultar un producto*/
use scliz;

delimiter $$
drop procedure if exists consultarProducto $$
create procedure consultarProducto(
	in pIdproducto int
)
begin
	select 
		n.nombreProducto,
		d.nombreDescripcionProducto,
		m.nombreMarcaProducto,
		i.valorIVA,
        p.pkIdProducto,
		p.cantidadStock,
		p.precioUnitarioProducto,
		p.estadoProducto
		from nombreProducto as n
		inner join producto p on n.pkIdNombreProducto = p.fkIdNombreProducto
		inner join descripcionProducto d on d.pkIdDescripcionProducto = p.fkIdDescripcionProducto
		inner join marcaProducto m on m.pkIdMarcaProducto = p.fkIdMarcaProducto
		inner join iva i on i.pkIdIVA = p.fkIdIVA
        where p.pkIdProducto = pIdProducto;
end $$
delimiter ;