/*Procedimiento para modificar la contraseña de un usuario*/
use scliz;

delimiter $$
drop function if exists modificarContrasenaUsuario $$
create function modificarContrasenaUsuario(
	pNombreUsuario varchar(10),
    pVerificacionContrasenaActual varchar(10),
    pNuevaContrasena varchar(10),
    pVerificacionNuevaContrasena varchar(10)
)
returns varchar (100)
deterministic
begin    
declare contrasenaActual varchar(10);
	
    select u.contrasenaUsuario
	into contrasenaActual
	from usuario as u
	where u.nombreUsuario = pNombreUsuario;
        
	if contrasenaActual = pVerificacionContrasenaActual then
		if pNuevaContrasena = pVerificacionNuevaContrasena then
			update usuario
				set usuario.contrasenaUsuario = pNuevaContrasena
			where usuario.nombreUsuario = pNombreUsuario;
			return "Se actualizo la contraseña";
			else
			return "La contraseña nueva y su verificación no son iguales";
		end if;
	else
        return "La contraseña esta mal";
        end if;
end $$
delimiter ;