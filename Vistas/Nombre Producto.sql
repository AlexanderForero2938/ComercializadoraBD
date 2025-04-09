/*Vista para mostrar los nombre de los productos registrados en el sistema*/
use scliz;

drop view if exists listarNombreProducto;

create view listarNombreProducto as
select 
	n.pkIdNombreProducto,
    n.nombreProducto
    from nombreProducto as n
    order by n.nombreProducto asc;