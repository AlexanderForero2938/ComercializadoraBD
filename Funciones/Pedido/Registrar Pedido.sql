/*Función para registrar un pedido*/
use scliz;

delimiter $$
drop function if exists registrarPedido $$
create function registrarPedido(
    pFechaLlegadaPedido date,
    pvalorTotalPedido decimal(10,2),
	pIdGerente int,
    pIdProveedor int
)
returns varchar (100)
deterministic
begin
	insert into pedido(
		fechaRealizoPedido,
        fechaLlegadaPedido,
        valorTotalPedido,
        estadoPedido,
        fkIdGerente,
        fkIdProveedor
		)
		values(
        curdate(),
        pFechaLlegadaPedido,
        pvalorTotalPedido,
        "ESPERA",
        pIdGerente,
        pIdProveedor
        );

        return "Se creo el pedido";
end$$
delimiter ;