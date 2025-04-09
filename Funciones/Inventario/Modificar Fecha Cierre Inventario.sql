/*Procedimiento para modificar un inventario*/
use scliz;

delimiter $$
drop function if exists modificarInventario $$
create function modificarInventario(
	pNumeroInventario int,
    pNuevaFechaCierreInventario date
)
returns varchar (100)
deterministic
begin    
    update inventario
		set inventario.fechaCierreInventario = pNuevaFechaCierreInventario
	where inventario.pkNumeroInventario = pNumeroInventario;
        
	return "Se modifico la fecha de cierre del inventario";
end $$
delimiter ;