/*Vista para mostrar los clientes registrados en el sistema*/
use scliz;

drop view if exists listarClientes;

create view listarClientes as
select 
	e.NITEmpresa,
    e.nombreEmpresa,
    e.numeroContactoEmpresa,
    e.direccionEmpresa,
    c.correoElectronicoCliente,
    c.estadoCliente
    from empresa as e
    inner join cliente c on e.pkIdEmpresa = c.fkIdEmpresa;