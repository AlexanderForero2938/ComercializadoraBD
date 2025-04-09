/*Procedimiento para consultar un empleado*/
use scliz;

delimiter $$
drop procedure if exists consultarEmpleado $$
create procedure consultarEmpleado(
	in pNumeroIdentificacionEmpleado int
)
begin
	select
		p.primerNombrePersona,
        p.segundoNombrePersona,
        p.primerApellidoPersona,
        p.segundoApellidoPersona,
        p.numeroIdentificacionPersona,
        t.nombreTipoIdentificacion,
        e.numeroContactoEmpleado,
        e.estadoEmpleado,
        r.nombreRol
        from persona as p
        inner join tipoIdentificacion as t on t.pkIdTipoIdentificacion = p.fkIdTipoIdentificacion
        inner join empleado as e on p.pkIdPersona = e.fkIdPersona
        inner join rol as r on r.pkIdRol = e.fkIdRol
        where p.numeroIdentificacionPersona = pNumeroIdentificacionEmpleado;
end $$
delimiter ;