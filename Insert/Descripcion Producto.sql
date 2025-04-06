/*Registros descripciones de los productos*/
use scliz;

insert into descripcionProducto(nombreDescripcionProducto, estadoDescripcionProducto)
values
	(upper("Negro"), "ACTIVO"),
    (upper("Rojo"), "ACTIVO"),
    (upper("Azul"), "ACTIVO"),
    (upper("Verde"), "ACTIVO"),
    (upper("Morado"), "ACTIVO");