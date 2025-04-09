/*Procedimiento para filtrar los roles y permisos vinculados*/
use scliz;

delimiter $$
drop procedure if exists filtrarRolPermiso $$
create procedure filtrarRolPermiso(
	in pNombreRol varchar(10)
)
begin
	select 
		rp.pkIdRolPermiso,
		rp.estadoRolPermiso,
		p.nombrePermiso,
		r.nombreRol
		from permiso as p
		inner join rolPermiso as rp on p.pkIdPermiso = rp.fkIdPermiso
		inner join rol as r on r.pkIdRol = rp.fkIdRol
        where r.nombrerol = upper(pNombreRol);
end $$
delimiter ;