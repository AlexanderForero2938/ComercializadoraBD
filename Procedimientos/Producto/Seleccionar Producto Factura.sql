/*Procedimiento para seleccionar un producto para una factura*/
use scliz;

delimiter $$
drop procedure if exists seleccionarProductoFactura $$
create procedure seleccionarProductoFactura(
	in pIdProducto int
)
begin
	select
		p.pkIdProducto,
        p.precioUnitarioProducto,
        i.valorIVA
        from producto as p
        inner join iva as i on i.pkIdIVA = p.fkIdIVA
        where p.pkIdProducto = pIdProducto;
end $$
delimiter ;