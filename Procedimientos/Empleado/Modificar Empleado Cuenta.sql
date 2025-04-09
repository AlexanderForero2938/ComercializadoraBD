/*Procedimiento para modificar un empleado*/
use scliz;

delimiter $$
drop procedure if exists modificarEmpleadoCuenta $$
create procedure modificarEmpleadoCuenta(
	in pNumeroIdentificacionPersona int,
    in pNuevoNumeroContactoEmpleado varchar(10)
)
begin  
    update empleado
    set empleado.numeroContactoEmpleado = pNuevoNumeroContactoEmpleado
    where fkIdPersona =(select pkIdPersona from persona where numeroIdentificacionPersona = pNumeroIdentificacionPersona);
    
end $$
delimiter ;