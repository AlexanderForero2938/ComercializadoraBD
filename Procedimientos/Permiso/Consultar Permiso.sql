/*Procedimiento para consultar un permiso*/
use scliz;

delimiter $$
drop procedure if exists consultarPermiso $$
create procedure consultarPermiso(
	in pIdPermiso int
)
begin
	select
		p.pkIdPermiso,
        p.nombrePermiso,
        p.estadoPermiso
        from permiso as p
        where p.pkIdPermiso = pIdPermiso;
end $$
delimiter ;