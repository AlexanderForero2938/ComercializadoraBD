/*Registros metodo de pago*/
use scliz;

insert into metodoPago(nombreMetodoPago, estadoMetodoPago)
values(upper("Efectivo"), 'ACTIVO');