/*Función para registrar un pedido*/
use scliz;

delimiter $$
drop function if exists registrarPedido $$
create function registrarPedido(
	pIdGerente int,
    pIdProveedor int
)
returns varchar(100)
deterministic
begin
	declare nuevoId int;
    declare resultado varchar(100);
    
	insert into pedido(
		fechaRealizoPedido,
        valorTotalPedido,
        estadoPedido,
        fkIdGerente,
        fkIdProveedor
		)
		values(
        curdate(),
        0,
        "ESPERA",
        pIdGerente,
        pIdProveedor
        );
			
        /*Obtener el id recien insertado*/
        set nuevoId = last_insert_id();
            
        /*Retornar el id insertado*/
        set resultado = nuevoId;
        return resultado;        
end$$
delimiter ;