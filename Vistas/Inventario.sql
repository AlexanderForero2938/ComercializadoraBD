/*Vista para mostrar los inventarios registrados en el sistema*/
use scliz;

drop view if exists listarInventarios;

create view listarInventarios as
select 
	i.pkNumeroInventario,
    i.fechaAbiertoInventario,
    i.fechaCierreInventario,
    i.valorTotalInventario,
    i.estadoInventario
    from inventario as i
    order by i.fechaAbiertoInventario desc;