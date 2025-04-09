/*Procedimiento para consultar un usuario*/
use scliz;

delimiter $$
drop procedure if exists consultarUsuario $$
create procedure consultarUsuario(
	in pNombreUsuario varchar(10)
)
begin
	select
		u.nombreUsuario
        from usuario as u
        where u.nombreUsuario = pNombreUsuario;
end $$
delimiter ;