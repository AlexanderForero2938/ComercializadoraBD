/*Vista para mostrar los proveedores registrados en el sistema*/
use scliz;

drop view if exists listarProveedores;

create view listarProveedores as
select 
	e.NITEmpresa,
    e.nombreEmpresa,
    e.numeroContactoEmpresa,
    e.direccionEmpresa,
    p.estadoProveedor
    from empresa as e
    inner join proveedor p on e.pkIdEmpresa = p.fkIdEmpresa;