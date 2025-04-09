/*Vista para mostrar los IVA registrados en el sistema*/
use scliz;

drop view if exists listarIVA;

create view listarIVA as
select 
	i.pkIdIVA,
    i.valorIVA
    from iva as i
    order by i.valorIVA asc;