/*Función para registrar un gerente*/
use comercializadora;

delimiter $$
drop function if exists registrarGerente  $$
create function registrarGerente(
    pIdPersona int
	)
returns varchar(100)
deterministic
begin
	insert into gerente(
			estadoGerente,
            fkIdPersona
			)
			values(
			"ACTIVO",
            pIdPersona
			);
            
		return "Se registro el gerente exitosamente";
end$$
delimiter ;