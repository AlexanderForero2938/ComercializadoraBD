/*Procedimiento para consultar un cliente*/
use comercializadora;

delimiter $$
drop procedure if exists consultarCliente $$
create procedure consultarCliente(
	in pNITCliente varchar(10),
    in pNombreCliente varchar(50)
)
begin
	select
		e.NITEmpresa,
        e.nombreEmpresa,
        e.numeroContactoEmpresa,
        e.direccionEmpresa,
        c.correoElectronicoCliente,
        c.estadoCliente
	from empresa as e
	inner join cliente c on e.pkIdEmpresa = c.fkIdEmpresa
	where nombreEmpresa = upper(pNombreCliente)
		or NITEmpresa = upper(pNITCliente);
end $$
delimiter ;