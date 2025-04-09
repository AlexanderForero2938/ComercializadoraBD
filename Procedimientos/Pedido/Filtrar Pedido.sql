/*Procedimiento para filtrar un pedido*/
use scliz;

delimiter $$
drop procedure if exists filtrarPedido $$
create procedure filtrarPedido(
    in pNombreEmpresa varchar(50),
    in pFechaInicio date,
    in pFechaFinal date
)
begin
	select 
		e.NITEmpresa,
		e.nombreEmpresa,
		e.numeroContactoEmpresa,
		p.pkNumeroPedido,
		p.fechaRealizoPedido,
		p.fechaLlegadaPedido,
		p.valorTotalPedido,
		p.estadoPedido
		from empresa as e
		inner join proveedor pr on e.pkIdEmpresa = pr.fkIdEmpresa
		inner join pedido p on pr.pkIdProveedor = p.fkIdProveedor
        where 
			(pNombreEmpresa is null or e.nombreEmpresa = upper(pNombreEmpresa))
            and (pfechaInicio is null or p.fechaRealizoPedido >= pFechaInicio)
            and (pfechaFinal is null or p.fechaRealizoPedido <= pFechaFinal);
end $$
delimiter ;