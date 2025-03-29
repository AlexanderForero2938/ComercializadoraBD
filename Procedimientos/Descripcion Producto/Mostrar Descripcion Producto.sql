/*Procedimiento para mostrar las descripciones de los productos registrados en el sistema*/
use comercializadora;

delimiter $$
drop procedure if exists mostrarDescripcionProducto $$
create procedure mostrarDescripcionProducto()
begin
	select 
		dp.pkIdDescripcionProducto,
        dp.nombreDescripcionProducto
	from descripcionProducto as dp
    order by dp.nombreDescripcionProducto asc;
end $$
delimiter ;