/*Procedimiento para modificar un proveedor*/
use comercializadora

delimiter $$
drop procedure if exists modificarProveedor $$
create procedure modificarProveedor(
	pNITEmpresa varchar(10),
	pNuevaDireccion varchar(50),
    pNuevoNumeroContacto varchar(10),
    pNuevoEstado varchar(10)
)
begin    
    update empresa
		set empresa.direccionEmpresa = upper(pNuevaDireccion),
			empresa.numeroContactoEmpresa = upper(pNuevoNumeroContacto),
            empresa.estadoEmpresa = upper(pNuevoEstado)
		where empresa.NITEmpresa = upper(pNITEmpresa);
	
    update proveedor
		set proveedor.estadoProveedor = upper(pNuevoEstado)
        where fkIdEmpresa = (select pkIdEmpresa from empresa where NITEmpresa = upper(pNITEmpresa));
end $$
delimiter ;