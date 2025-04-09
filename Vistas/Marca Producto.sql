/*Vista para mostrar las marcas de los productos registrados en el sistema*/
use scliz;

drop view if exists listarMarcasProductos;

create view listarMarcasProductos as
select 
	m.pkIdMarcaProducto,
    m.nombreMarcaProducto
    from marcaProducto as m
    order by m.nombreMarcaProducto asc;