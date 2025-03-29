/*Vista información producto*/
use comercilizadora;

delimiter $$
drop procedure if exists informacionProducto $$
create procedure informacionProducto(
	in pNombreProducto varchar(20),
	in pNombreMarcaproducto varchar(20),
    in pDescripcionProducto varchar(20)
)
begin
	select
		
