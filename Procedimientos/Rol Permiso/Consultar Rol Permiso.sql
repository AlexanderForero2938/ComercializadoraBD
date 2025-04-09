/*Procedimiento para consultar un rol permiso*/
use scliz;

delimiter $$
drop procedure if exists consultarRolPermiso $$
create procedure consultarRolPermiso(
	in pIdRolPermiso int
)
begin
	select
		rp.pkIdRolPermiso,
        p.nombrePermiso,
        r.nombreRol
        from permiso as p
        inner join rolPermiso as rp on p.pkIdPermiso = rp.fkIdPermiso
        inner join rol as r on r.pkIdRol = rp.fkIdRol
        where rp.pkIdRolPermiso = pIdRolPermiso;
end $$
delimiter ;