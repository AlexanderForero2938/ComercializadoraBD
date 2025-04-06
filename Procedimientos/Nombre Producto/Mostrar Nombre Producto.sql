/*Procedimiento para mostrar los nombre de los productos registrados en el sistema*/
use scliz;

delimiter $$
drop procedure if exists mostrarNombreProducto $$
create procedure mostrarNombreProducto()
begin
	select 
		np.pkIdNombreProducto,
        np.nombreProducto
	from nombreProducto as np
    order by np.nombreProducto asc;
end $$
delimiter ;