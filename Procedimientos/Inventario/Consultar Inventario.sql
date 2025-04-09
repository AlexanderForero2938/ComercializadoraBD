/*Procedimiento para consultar un inventario*/
use scliz;

delimiter $$
drop procedure if exists consultarInventario $$
create procedure consultarInventario(
    in pNumeroInventario int 
)
begin
	select 
		i.pkNumeroInventario,
		i.fechaAbiertoInventario,
		i.fechaCierreInventario,
		i.valorTotalInventario,
		i.estadoInventario
		from inventario as i
        where i.pkNumeroInventario = pNumeroInventario;
end $$
delimiter ;