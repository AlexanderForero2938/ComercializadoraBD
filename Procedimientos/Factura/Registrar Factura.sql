/*Procedimiento para registrar factura*/
use scliz;

delimiter $$
drop procedure if exists registarFactura $$
create procedure registrarFactura(
	in pValorTotalFactura decimal(10,2),
    in pIdEmpleado int,
    in pIdCliente int,
    in pIdMetodoPago int
)
begin
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
            pValorTotalFactura,
            'ACTIVO',
            pIdEmpleado,
            pIdCliente,
            pIdMetodoPago
            );
end$$
delimiter ;