/*Procedimiento para modificar un gerente*/
use comercilizadora

delimiter $$
drop procedure if exists modificarGerente $$
create procedure modificarGerente(
	in pNumeroIdentificacionPersona int,
    in pNuevoEstado varchar(10)
)
begin
	update persona
    set persona.estadoPersona = upper(pNuevoEstado)
    where persona.numeroIdentificacionPersona = pNumeroIdentificacionPersona;
    
    update gerente
    set gerente.estadoGerente = upper(pNuevoEstado)
    where fkIdPersona =(select pkIdPersona from persona where numeroIdentificacionPersona = pNumeroIdentificacionPersona);
    
end $$
delimiter ;