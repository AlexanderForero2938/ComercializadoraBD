/*Procedimiento para registrar factura*/
use scliz;

delimiter $$
drop function if exists registrarFactura $$
create function registrarFactura(
    pIdEmpleado int,
    pIdCliente int,
    pIdMetodoPago int
)
returns varchar(100)
deterministic
begin
	declare nuevoId int;
    declare resultado varchar(100);
    
	insert into factura(
			fechaCreacionFactura,
            horaCreacionFactura,
            valorTotalFactura,
            estadoFactura,
            fkIdEmpleado,
            fkIdCliente,
            fkIdMetodoPago
			)
			values(
			curdate(),
            curtime(),
            0,
            'PENDIENTE',
            pIdEmpleado,
            pIdCliente,
            pIdMetodoPago
            );
			
            /*Obtener el id recien insertado*/
            set nuevoId = last_insert_id();
            
            /*Retornar el id insertado*/
            set resultado = nuevoId;
            return resultado;
end$$
delimiter ;