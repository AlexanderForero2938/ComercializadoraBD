/*Vista para mostrar los roles registrados en el sistema*/
use scliz;

drop view if exists listarRoles;

create view listarRoles as
select 
	r.pkIdRol,
    r.nombreRol,
    r.estadoRol
    from rol as r;