/*Vista para mostrar los empleados registrados en el sistema*/
use scliz;

drop view if exists listarEmpleados;

create view listarEmpleados as
select 
	p.primerNombrePersona,
    p.segundoNombrePersona,
    p.primerApellidoPersona,
    p.segundoApellidoPersona,
    p.numeroIdentificacionPersona,
    e.numeroContactoEmpleado,
    e.estadoEmpleado,
    r.nombreRol
    from persona as p
    inner join empleado e on p.pkIdPersona = e.fkIdPersona
    inner join rol r on r.pkIdRol = e.fkIdRol;