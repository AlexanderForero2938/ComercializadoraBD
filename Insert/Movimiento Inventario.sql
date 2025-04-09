/*Registros movimiento inventario*/
use scliz;

insert into movimientoInventario(nombreMovimientoInventario, estadoMovimientoInventario)
values
	(upper("Entrada"), "ACTIVO"),
    (upper("Salida"), "ACTIVO");