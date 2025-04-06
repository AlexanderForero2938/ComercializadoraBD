/*Función para registrar una persona*/
use scliz;

delimiter $$
drop function if exists registrarPersona  $$
create function registrarPersona(
	pPrimerNombrePersona varchar(45),
	pSegundoNombrePersona varchar(45),
    pPrimerApellidoPersona varchar(45),
    pSegundoApellidoPersona varchar(45),
    pNumeroIdentificacionPersona int,
    pIdTipoIdentifiacion int
	)
returns varchar(100)
deterministic
begin
	declare nuevoId int;
	declare existeNumeroIdentificacion int;
    declare resultado varchar(100);
   
   /*Verificar si exsite el número de identificación*/
   select count(*) 
   into existeNumeroIdentificacion 
   from persona 
   where numeroIdentificacionPersona = pNumeroIdentificacionPersona;
    
	if existeNumeroIdentificacion > 0 then
		return  "Error: ese número de identificación ya se encuentra registrado";
    else
		insert into persona(
				primerNombrePersona,
				segundoNombrePersona,
				primerApellidoPersona,
				segundoApellidoPersona,
				numeroIdentificacionPersona,
				estadoPersona,
				fkIdTipoIdentificacion
				)
				values(
				upper(pPrimerNombrePersona),
				upper(pSegundoNombrePersona),
				upper(pPrimerApellidoPersona),
				upper(pSegundoApellidoPersona),
				pNumeroIdentificacionPersona,
				"ACTIVO",
				pIdTipoIdentifiacion
				);
	
			/*Obtener el id recien insertado*/
			set nuevoId = last_insert_id();
            
            /*Retornar el id insertado*/
            set resultado = nuevoId;
            return resultado;
	end if;
end$$
delimiter ;