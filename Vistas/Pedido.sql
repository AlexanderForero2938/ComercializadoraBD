/*Vista para mostrar los proveedores registrados en el sistema*/
use scliz;

drop view if exists listarPedidos;

create view listarPedidos as
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
    inner join pedido p on pr.pkIdProveedor = p.fkIdProveedor;