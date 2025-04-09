/*Procedimiento para filtrar un producto*/
use scliz;

delimiter $$
drop procedure if exists filtrarProducto $$
create procedure filtrarProducto(
    in pNombreProducto varchar(20),
    in pNombreMarcaProducto varchar(20),
    in pNombreDescripcionProducto varchar(20)
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
        where 
			(pNombreProducto is null or n.nombreProducto = upper(pNombreProducto))
            and (pNombreMarcaProducto is null or m.nombreMarcaProducto = upper(pNombreMarcaProducto))
            and (pNombreDescripcionProducto is null or d.nombreDescripcionProducto = upper(pNombreDescripcionProducto));
end $$
delimiter ;