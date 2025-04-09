/*Procedimiento para consultar una factura*/
use scliz;

delimiter $$
drop procedure if exists consultarFactura $$
create procedure consultarFactura(
    in pNITEmpresa varchar(10)
)
begin
	select 
		f.pkNumeroFactura,
		f.fechaCreacionFactura,
		f.horaCreacionFactura,
		f.valorTotalFactura,
		f.estadoFactura,
		e.NITEmpresa,
		e.nombreEmpresa
		from empresa as e
		inner join cliente as c on e.pkIdEmpresa = c.fkIdEmpresa
		inner join factura as f on c.pkIdCliente = f.fkIdCliente
        where e.NITEmpresa = pNITEmpresa;
end $$
delimiter ;