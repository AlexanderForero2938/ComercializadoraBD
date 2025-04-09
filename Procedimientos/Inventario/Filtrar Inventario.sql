/*Procedimiento para filtrar un inventario*/
use scliz;

delimiter $$
drop procedure if exists filtrarInventario $$
create procedure filtrarInventario(
    in pNumeroInventario varchar(50),
    in pFechaInicio date,
    in pFechaFinal date
)
begin
	select 
		i.pkNumeroInventario,
		i.fechaAbiertoInventario,
		i.fechaCierreInventario,
		i.valorTotalInventario,
		i.estadoInventario
		from inventario as i
        where 
			(pNumeroInventario is null or i.pkNumeroInventario = pNumeroInventario)
            and (pfechaInicio is null or i.fechaAbiertoInventario >= pFechaInicio)
            and (pfechaFinal is null or i.fechaAbiertoInventario <= pFechaFinal);
end $$
delimiter ;

