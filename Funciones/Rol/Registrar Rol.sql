/*Función para registrar un usuario*/
use scliz;

delimiter $$
drop function if exists registrarRol $$
create function registrarRol(
	pNombreRol varchar(20)
)
returns varchar(100)
deterministic
begin
	declare existeNombre int;
	
    /*Verificar si existe el nombre*/
    select count(*) 
    into existeNombre 
    from rol 
    where nombreRol = upper(pNombreRol);
    
    if existeNombre > 0 then
		return "Error: ese nombre de usuario ya se encuentra registrado";
	else
		insert into rol(
				nombreRol,
                estadoRol
                )
                values(
                upper(pNombreRol),
                "ACTIVO"
                );
            
		return "Se registro el usuario exitosamente";
	end if;
end$$
delimiter ;