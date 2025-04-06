/*Procedimiento para modificar un cliente*/
use scliz;

delimiter $$
drop procedure if exists modificarCliente $$
create procedure modificarCliente(
	pNITEmpresa varchar(10),
	pNuvoCorreoElectronico varchar(50),
    pNuevoNumeroContacto varchar(10),
    pNuevoEstado varchar(10)
)
begin    
    update empresa
		set empresa.numeroContactoEmpresa = upper(pNuevoNumeroContacto),
            empresa.estadoEmpresa = upper(pNuevoEstado)
		where empresa.NITEmpresa = upper(pNITEmpresa);
	
    update cliente
		set cliente.correoElectronicoCliente = upper(pNuvoCorreoElectronico),
			cliente.estadoCliente = upper(pNuevoEstado)
        where fkIdEmpresa = (select pkIdEmpresa from empresa where NITEmpresa = upper(pNITEmpresa));
end $$
delimiter ;