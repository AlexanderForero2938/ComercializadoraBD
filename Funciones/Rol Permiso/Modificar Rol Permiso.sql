/*Procedimiento para modificar un rol permiso*/
use scliz;

delimiter $$
drop function if exists modificarEstadoRolPermiso $$
create function modificarEstadoRolPermiso(
	pIdRolPermiso varchar(10),
    pNuevoEstado varchar(10)
)
returns varchar (100)
deterministic
begin    
    update rolPermiso
		set rolPermiso.estadoRolPermiso = upper(pNuevoEstado)
	where rolPermiso.pkIdRolPermiso = pIdRolPermiso;
        
	return "Se modifico el Rol Permiso";
end $$
delimiter ;