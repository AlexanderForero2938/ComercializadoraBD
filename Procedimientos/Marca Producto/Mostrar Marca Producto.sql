/*Procedimiento para mostrar los nombre de las marcas registrados en el sistema*/
use scliz;

delimiter $$
drop procedure if exists mostrarMarcaProducto $$
create procedure mostrarMarcaProducto()
begin
	select 
		mp.pkIdMarcaProducto,
        mp.nombreMarcaProducto
	from marcaProducto as mp
    order by mp.nombreMarcaProducto asc;
end $$
delimiter ;