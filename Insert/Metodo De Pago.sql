/*Registros metodo de pago*/
use comercializadora;

insert into metodoPago(nombreMetodoPago, estadoMetodoPago)
values(upper("Efectivo"), 'ACTIVO');