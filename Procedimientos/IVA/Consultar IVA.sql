/*Procedimiento para consultar el IVA*/
use scliz;

delimiter $$
drop procedure if exists consultarIVA $$
create procedure consultarIVA()
begin
	select
		i.pkIdIVA,
		i.valorIVA
        from iva as i
        order by i.valorIVA asc;

end $$
delimiter ;