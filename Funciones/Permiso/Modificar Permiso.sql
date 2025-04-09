/*Procedimiento para modificar el estado de un permiso registrado en el sistema*/
use scliz;

delimiter $$
drop function if exists modificarEstadoPermiso $$
create function modificarEstadoPermiso(
	pIdPermiso int,
    pNuevoEstadoPermiso varchar(10)
)
returns varchar (100)
deterministic
begin            
	update permiso
    set permiso.estadoPermiso = upper(pNuevoEstadoPermiso)
	where permiso.pkIdPermiso = pIdPermiso;
    
    return "Se modifico el estado del permiso";
end $$
delimiter ;