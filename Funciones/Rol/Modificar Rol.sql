/*Procedimiento para modificar un rol registrado en el sistema*/
use scliz;

delimiter $$
drop function if exists modificarRol $$
create function modificarRol(
	pIdRol int,
    pNuevoNombreRol varchar(20),
    pNuevoEstadoRol varchar(10)
)
returns varchar (100)
deterministic
begin            
	update rol
    set rol.nombreRol = upper(pNuevoNombreRol),
		rol.estadoRol = upper(pNuevoEstadoRol)
	where rol.pkIdRol = pIdRol;
    
    return "Se modifico la información del rol";
end $$
delimiter ;