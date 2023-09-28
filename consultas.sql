# Seleccionar la id de los paquetes que fueron entregados, los choferes que llevaron dichos paquetes, en que fechas y la matricula del camion
SELECT p.id, u.username, u.nombre, u.apellido, v.matricula, cp.fecha_inicio, cpf.fecha_fin
FROM usuario AS u
INNER JOIN chofer AS c ON u.id = c.id
INNER JOIN maneja AS m ON c.id = m.id_usuario
INNER JOIN vehiculo AS v ON m.id_vehiculo = v.id
INNER JOIN carga_paquete AS cp ON v.id = cp.id_vehiculo
INNER JOIN carga_paquete_fin AS cpf ON cp.id = cpf.id
INNER JOIN paquete AS p ON cp.id_paquete = p.id
INNER JOIN paquete_entregado AS pe ON p.id = pe.id;
