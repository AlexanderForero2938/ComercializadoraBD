/*Procedimiento para modificar un empleado*/
use scliz;

delimiter $$
drop procedure if exists modificarEmpleado $$
create procedure modificarEmpleado(
	in pNumeroIdentificacionPersona int,
    in pNuevoEstado varchar(10),
    in pNuevoNumeroContactoEmpleado varchar(10),
    in pIdNuevoRol int
)
begin
	update persona
    set persona.estadoPersona = upper(pNuevoEstado)
    where persona.numeroIdentificacionPersona = pNumeroIdentificacionPersona;
    
    update empleado
    set empleado.numeroContactoEmpleado = pNuevoNumeroContactoEmpleado,
		empleado.estadoEmpleado = upper(pNuevoEstado),
        empleado.fkIdRol = pIdNuevoRol
    where fkIdPersona =(select pkIdPersona from persona where numeroIdentificacionPersona = pNumeroIdentificacionPersona);
    
end $$
delimiter ;