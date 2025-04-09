/*Procedimiento para consultar un cliente*/
use scliz;

delimiter $$
drop procedure if exists consultarRol $$
create procedure consultarRol(
	in pIdRol int
)
begin
	select
		r.pkIdRol,
        r.nombreRol,
        r.estadoRol
        from rol as r
        where r.pkIdRol = pIdRol;
end $$
delimiter ;