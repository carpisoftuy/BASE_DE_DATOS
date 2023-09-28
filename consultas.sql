#Selecciona el nombre de usuario de los choferes, la matricula de los vehiculos en los que se cargó y los datos del paquete entregado con id 2
SELECT u.username, v.matricula, p.*
FROM usuario AS u
INNER JOIN chofer AS c ON u.id = c.id
INNER JOIN maneja AS m ON c.id = m.id_usuario
INNER JOIN vehiculo AS v ON m.id_vehiculo = v.id
INNER JOIN carga_paquete AS cp ON v.id = cp.id_vehiculo
INNER JOIN paquete AS p ON cp.id_paquete = p.id
INNER JOIN paquete_entregado AS pe ON p.id = pe.id
WHERE p.id = 2;
