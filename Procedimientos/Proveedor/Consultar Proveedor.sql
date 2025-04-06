/*Procedimiento para consultar un proveedor*/
use scliz;

delimiter $$
drop procedure if exists consultarProveedor $$
create procedure consultarProveedor(
	in pNITProveedor varchar(10),
    in pNombreProveedor varchar(50)
)
begin
	select
		e.NITEmpresa,
        e.nombreEmpresa,
        e.numeroContactoEmpresa,
        e.direccionEmpresa,
        p.estadoProveedor
	from empresa as e
	inner join proveedor p on e.pkIdEmpresa = p.fkIdEmpresa
	where nombreEmpresa = upper(pNombreProveedor)
		or NITEmpresa = upper(pNITProveedor);
end $$
delimiter ;
