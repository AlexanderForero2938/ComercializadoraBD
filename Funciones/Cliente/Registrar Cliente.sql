/*Función para registrar un cliente*/
use scliz;

delimiter $$
drop function if exists registrarCliente  $$
create function registrarCliente(
	pCorreoElectronicoCliente varchar(50),
	pFkIdEmpresa int
	)
returns varchar (100)
deterministic
begin
	insert into cliente(
			correoElectronicoCliente,
			estadoCliente,
            fkIdEmpresa
            )
			values(
            upper(pCorreoElectronicoCliente),
            "ACTIVO",
            pFkIdEmpresa
            );
		
        return "Se registro exitosamente el cliente";
end$$
delimiter ;