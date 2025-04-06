/*Función para registrar un empleado*/
use scliz;

delimiter $$
drop function if exists registrarEmpleado  $$
create function registrarEmpleado(
    pNumeroContactoEmpleado varchar(10),
	pIdPersona int,
    pIdUsuario int,
    pIdRol int
	)
returns varchar(100)
deterministic
begin
	insert into empleado(
			numeroContactoEmpleado,
			estadoEmpleado,
            fkIdPersona,
            fkIdUsuario,
            fkIdRol
			)
			values(
            pNumeroContactoEmpleado,
			"ACTIVO",
            pIdPersona,
            pIdUsuario,
            pIdRol
			);
            
		return "Se registro el empleado exitosamente";
end$$
delimiter ;