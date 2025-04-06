/*Procedimiento para consultar un gerente*/
use scliz;

delimiter $$
drop procedure if exists consultarGerente $$
create procedure consultarGerente(
	in pNumeroIdentificacionGerente int
)
begin
	select
		p.primerNombrePersona,
        p.segundoNombrePersona,
        p.primerApellidoPersona,
        p.segundoApellidoPersona,
        p.numeroIdentificacionPersona,
        t.nombreTipoIdentificacion,
        g.estadoGerente
        from persona as p
        inner join tipoIdentificacion as t on t.pkIdTipoIdentificacion = p.fkIdTipoIdentificacion
        inner join gerente as g on p.pkIdPersona = g.fkIdPersona
        where p.numeroIdentificacionPersona = pNumeroIdentificacionGerente;
end $$
delimiter ;