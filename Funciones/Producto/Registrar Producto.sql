/*Función para registrar un producto*/
use scliz;

delimiter $$
drop function if exists registrarProducto $$
create function registrarProducto(
	pPrecioUnitarioProductoSinIVA decimal(10,2),
    pPrecioUnivatioProductoConIVA decimal(10,2),
    pIdIVA int,
    pIdNombreProducto int,
    pIdDescripcionProducto int,
    pIdMarcaProducto int
)
returns varchar(100)
deterministic
begin
	declare nuevoId int;
    
    insert into producto(
			cantidadStock,
            precioUnitarioProductoSinIVA,
            precioUnitarioProductoConIVA,
            estadoProducto,
            fkIdIVA,
            fkIdNombreProducto,
            fkIdDescripcionProducto,
            fkIdMarcaProducto
            )
            values(
            0,
            pPrecioUnitarioProductoSinIVA,
            pPrecioUnivatioProductoConIVA,
            "ACTIVO",
            pIdIVA,
            pIdNombreProducto,
            pIdDescripcionProducto,
            pIdMarcaProducto
            );

            return "Se registro exitosamente el producto en el sistema";
end $$
delimiter ;