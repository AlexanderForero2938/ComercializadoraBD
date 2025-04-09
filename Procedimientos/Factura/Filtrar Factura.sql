/*Procedimiento para filtrar una factura*/
use scliz;

delimiter $$
drop procedure if exists filtrarFactura $$
create procedure filtrarFactura(
    in pNombreEmpresa varchar(50),
    in pFechaInicio date,
    in pFechaFinal date
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
        where 
			(pNombreEmpresa is null or e.nombreEmpresa = upper(pNombreEmpresa))
            and (pfechaInicio is null or f.fechaCreacionFactura >= pFechaInicio)
            and (pfechaFinal is null or f.fechaCreacionFactura <= pFechaFinal);
end $$
delimiter ;

