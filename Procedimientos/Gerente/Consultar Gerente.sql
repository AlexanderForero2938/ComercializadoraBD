/*Procedimiento para consultar un gerente*/
use comercializadora

delimiter $$
drop procedure if exists consultarGerente $$
create procedure consultarGerente(
	in pIdGerente int
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
        where g.pkIdGerente = pIdGerente;
end $$
delimiter ;