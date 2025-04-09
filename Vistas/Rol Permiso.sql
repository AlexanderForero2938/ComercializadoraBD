/*Vista para mostrar los roles permisos registrados en el sistema*/
use scliz;

drop view if exists listarRolesPermisos;

create view listarRolesPermisos as
select 
	rp.pkIdRolPermiso,
    rp.estadoRolPermiso,
    p.nombrePermiso,
    r.nombreRol
    from permiso as p
    inner join rolPermiso as rp on p.pkIdPermiso = rp.fkIdPermiso
    inner join rol as r on r.pkIdRol = rp.fkIdRol;