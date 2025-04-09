/*Vista para mostrar los permisos registrados en el sistema*/
use scliz;

drop view if exists listarPermisos;

create view listarPermisos as
select 
	p.pkIdPermiso,
	p.nombrePermiso,
    p.estadoPermiso
    from permiso as p;