/*Función para crear un inventario*/
use scliz;

delimiter $$
drop function if exists crearInventario;  $$
create function crearInventario(
	pFechaCierreInventario date
	)
returns varchar (100)
deterministic
begin
	insert into inventario(
			fechaAbiertoInventario,
            fechaCierreInventario,
            valorTotalInventario,
            estadoInventario
            )
			values(
            curdate(),
            pFechaCierreInventario,
            0,
            "ABIERTO"
            );
		
        return "Se creo el inventario exitosamente";
end$$
delimiter ;