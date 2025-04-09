/*Función para registrar un rol permiso*/
use scliz;

delimiter $$
drop function if exists registrarRolPermiso  $$
create function registrarRolPermiso(
	pIdRol int,
    pIdPermiso int
	)
returns varchar (100)
deterministic
begin
	insert into rolPermiso(
			estadoRolPermiso,
            fkIdRol,
            fkIdPermiso
            )
			values(
            "ACTIVO",
            pIdRol,
            pIdPermiso
            );
		
        return "Se asocio exitosamente el rol con el permiso";
end$$
delimiter ;