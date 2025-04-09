/*Vista para mostrar las facturas registradas en el sistema*/
use scliz;

drop view if exists listarFacturas;

create view listarFacturas as
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
    inner join factura as f on c.pkIdCliente = f.fkIdCliente;