/*Procedimiento para modificar un cliente*/
use scliz;

delimiter $$
drop procedure if exists modificarCliente $$
create procedure modificarCliente(
	pNITEmpresa varchar(10),
    pNuevoEstado varchar(10),
    pNuevoCorreoElectronico varchar(50)
)
begin    
    update empresa
		set empresa.estadoEmpresa = upper(pNuevoEstado)
		where empresa.NITEmpresa = upper(pNITEmpresa);
	
    update cliente
		set cliente.estadoCliente = upper(pNuevoEstado),
			cliente.correoElectronicoCliente = pNuevoCorreoElectronico
        where fkIdEmpresa = (select pkIdEmpresa from empresa where NITEmpresa = upper(pNITEmpresa));
end $$
delimiter ;