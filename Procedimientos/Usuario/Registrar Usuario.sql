/*Procedimiento para registrar un usuario*/
use scliz;

delimiter $$
drop procedure if exists registrarUsuario $$
create procedure registrarUsuario(
	in pNombreUsuario varchar(10),
    in pContrasenaUsuario varchar(10)
)
begin
	insert into usuario(
			nombreUsuario,
            contrasenaUsuario,
            estadoUsuario
            )
            values(
            pNombreUsuario,
            pContrasenaUsuario,
            "ACTIVO"
            );
end$$
delimiter ;