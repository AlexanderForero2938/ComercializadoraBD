/*Registros nombres de productos*/
use comercializadora;

insert into nombreProducto(nombreProducto, estadoNombreProducto)
values
	(upper("Lapiz"), "ACTIVO"),
    (upper("Esfero"), "ACTIVO"),
    (upper("Color"), "ACTIVO"),
    (upper("Marcador"), "ACTIVO"),
    (upper("Cuaderno"), "ACTIVO"),
    (upper("Papel"), "ACTIVO"),
    (upper("Bolso"), "ACTIVO"),
    (upper("Cartuchera"), "ACTIVO"),
    (upper("Pegante"), "ACTIVO"),
    (upper("Tijera"), "ACTIVO");