/*Función para registrar un pedido*/
use comercializadora;

delimiter $$
drop function if exists registrarPedido $$
create function registrarPedido(
	pIdGerente int
)
returns varchar (100)
deterministic
begin
	insert into pedido(
		fechaRealizoPedido,
        estadoPedido,
        fkIdGerente
		)
		values(
        curdate(),
        "ESPERA",
        pIdGerente
        );

        return "Se creo el pedido";
end$$
delimiter ;