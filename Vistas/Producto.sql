/*Vista para mostrar los productos registrados en el sistema*/
use scliz;

drop view if exists listarProductos;

create view listarProductos as
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
    inner join iva i on i.pkIdIVA = p.fkIdIVA;