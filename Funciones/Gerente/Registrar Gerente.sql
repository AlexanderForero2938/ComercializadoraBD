/*Función para registrar un gerente*/
use scliz;

delimiter $$
drop function if exists registrarGerente  $$
create function registrarGerente(
    pIdPersona int,
    pIdUsuario int,
    pIdRol int
	)
returns varchar(100)
deterministic
begin
	insert into gerente(
			estadoGerente,
            fkIdPersona,
            fkIdUsuario,
            fkIdRol
			)
			values(
			"ACTIVO",
            pIdPersona,
            pIdUsuario,
            pIdRol
			);
            
		return "Se registro el gerente exitosamente";
end$$
delimiter ;