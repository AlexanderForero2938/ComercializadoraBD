/*Función para registrar un proveedor*/
use comercializadora;

delimiter $$
drop function if exists registrarProveedor $$
create function registrarProveedor(
	pFkIdEmpresa int
	)
returns varchar (100)
deterministic
begin
	insert into proveedor(
			estadoProveedor,
            fkIdEmpresa
            )
			values(
            "ACTIVO",
            pFkIdEmpresa
            );
		
        return "Se registro exitosamente el proveedor";
end$$
delimiter ;