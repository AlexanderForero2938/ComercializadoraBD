/*Función para registrar un empleado*/
use comercializadora;

delimiter $$
drop function if exists registrarEmpleado  $$
create function registrarEmpleado(
    pIdPersona int,
    pNumeroContactoEmpleado varchar(10)
	)
returns varchar(100)
deterministic
begin
	insert into empleado(
			numeroContactoEmpleado,
			estadoEmpleado,
            fkIdPersona
			)
			values(
            pNumeroContactoEmpleado,
			"ACTIVO",
            pIdPersona
			);
            
		return "Se registro el empleado exitosamente";
end$$
delimiter ;