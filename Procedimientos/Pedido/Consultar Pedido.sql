/*Procedimiento para consultar una compra*/
use scliz;

delimiter $$
drop procedure if exists consultarPedido $$
create procedure consultarPedido(
	in pNITProveedor varchar(10),
    in pNombreProveedor varchar(50)
)
begin
	select
		e.NITEmpresa,
        e.nombreEmpresa,
        e.numeroContactoEmpresa,
        e.direccionEmpresa,
		p.fechaRealizoPedido,
        p.fechaLlegadaPedido,
        p.valorTotalPedido,
        p.estadoPedido
        from pedido as p
        inner join proveedor pr on pr.pkIdProveedor = p.fkIdProveedor
        inner join empresa e on e.pkIdEmpresa = pr.fkIdEmpresa
        where e.NITEmpresa = pNITProveedor
			or e.nombreEmpresa = pNombreProveedor;
end $$
delimiter ;