/*Función para registrar una empresa*/
use comercializadora;

delimiter $$
drop function if exists registrarEmpresa $$
create function registrarEmpresa(
	pNITEmpresa varchar(10),
    pNombreEmpresa varchar(50),
    pNumeroContactoEmpresa varchar(10),
    pDireccionEmpresa varchar(50)
    )
returns varchar(100)
deterministic
begin
	declare existeNombre int;
    declare existeNIT int;
    declare existeDireccion int;
	declare nuevoId int;
    declare resultado varchar(100);

	/*Verificar si existe el nombre*/
    select count(*) 
    into existeNombre 
    from empresa 
    where nombreEmpresa = upper(pNombreEmpresa);
    
    /*Verificar si exsite el NIT*/
    select count(*) 
    into existeNIT 
    from empresa 
    where NITEmpresa = upper(pNITEmpresa);
    
    /*Verificar si existe dirección*/
    select count(*) 
    into existeDireccion 
    from empresa 
    where direccionEmpresa = upper(pDireccionEmpresa);
    
    if existeNombre > 0 then
		return "Error: el nombre de la empresa ya esta registrado";
	elseif existeNIT > 0 then
        return "Error: el NIT de la empresa ya esta registrado";
	elseif existeDireccion > 0 then
        return "Error: la Dirección de la empresa ya esta registrada";
    else
		insert into empresa(
				NITEmpresa,
				nombreEmpresa,
				numeroContactoEmpresa,
				direccionEmpresa,
				estadoEmpresa
				)
				values(
				upper(pNITEmpresa),
				upper(pNombreEmpresa),
				upper(pNumeroContactoEmpresa),
				upper(pDireccionEmpresa),
				"ACTIVO"
				);
			
            /*Obtener el id recien insertado*/
            set nuevoId = last_insert_id();
            
            /*Retornar el id insertado*/
            set resultado = nuevoId;
            return resultado;
	end if;
end $$
delimiter ;