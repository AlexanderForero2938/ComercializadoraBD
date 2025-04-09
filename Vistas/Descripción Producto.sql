/*Vista para mostrar la descripción de los productos registrados en el sistema*/
use scliz;

drop view if exists listarDescripcionProducto;

create view listarDescripcionProducto as
select 
	d.pkIdDescripcionProducto,
    d.nombreDescripcionProducto
    from descripcionProducto as d
    order by d.nombreDescripcionProducto asc;