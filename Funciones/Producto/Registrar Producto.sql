/*Función para registrar un producto*/
use comercializadora;

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
returns int
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
			
            /*Obtener el id recien insertado*/
            set nuevoId = last_insert_id();
            
            /*Retornar el id insertado*/
            return nuevoId;
end $$
delimiter ;