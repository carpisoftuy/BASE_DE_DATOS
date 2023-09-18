###creación de usuarios###
CREATE USER 'administrador'@'%' IDENTIFIED BY 'admin-cft';
CREATE USER 'chofer'@'%' IDENTIFIED BY 'chofer-cft';
CREATE USER 'almacenero'@'%' IDENTIFIED BY 'almacenero-cft';

###Privilegios Admin###
##el admin tiene que tener permisos sobre todas las tablas##
GRANT ALL PRIVILEGES ON carpifast2 TO 'administrador'@'%';

###Privilegios chofer###
GRANT select ON almacen TO 'chofer'@'%';
GRANT select ON chofer TO 'chofer'@'%';
GRANT select ON vehiculo TO 'chofer'@'%';
GRANT select ON camioneta TO 'chofer'@'%';
GRANT select ON camion TO 'chofer'@'%';
GRANT select ON paquete TO 'chofer'@'%';
GRANT select, update, insert ON paquete_entregado TO 'chofer'@'%';
GRANT select, update, insert ON paquete_para_entregar TO 'chofer'@'%';
GRANT select, update, insert ON paquete_para_recoger TO 'chofer'@'%';
GRANT select, update, insert ON paquete_recogido TO 'chofer'@'%';
GRANT select, insert ON ubicacion TO 'chofer'@'%';
GRANT select ON maneja TO 'chofer'@'%';
GRANT select ON maneja_fin TO 'chofer'@'%';
GRANT select ON usuario TO 'chofer'@'%';
GRANT select ON carga_bulto TO 'chofer'@'%';
GRANT select ON carga_bulto_fin TO 'chofer'@'%';
GRANT select ON carga_paquete TO 'chofer'@'%';
GRANT select ON carga_paquete_fin TO 'chofer'@'%';

###Privilegios almacenero###
GRANT select ON vehiculo TO 'almacenero'@'%';
GRANT select ON camioneta TO 'almacenero'@'%';
GRANT select ON camion TO 'almacenero'@'%';
GRANT select ON almacenero TO 'almacenero'@'%';
GRANT select ON almacen TO 'almacenero'@'%';
GRANT select, update, insert ON almacen_contiene_bulto TO 'almacenero'@'%';
GRANT select, update, insert ON almacen_contiene_bulto_fin TO 'almacenero'@'%';
GRANT select, update, insert ON almacen_contiene_paquete TO 'almacenero'@'%';
GRANT select, update, insert ON almacen_contiene_paquete_fin TO 'almacenero'@'%';
GRANT select, update, insert ON bulto TO 'almacenero'@'%';
GRANT select, update, insert ON bulto_contiene TO 'almacenero'@'%';
GRANT select, update, insert ON bulto_contiene_fin TO 'almacenero'@'%';
GRANT select, update, insert ON bulto_desarmado TO 'almacenero'@'%';
GRANT select, update, insert ON gestiona TO 'almacenero'@'%';
GRANT select, update, insert ON gestiona_fin TO 'almacenero'@'%';
GRANT select, update, insert ON paquete_para_entregar TO 'almacenero'@'%';
GRANT select, update, insert ON paquete_para_recoger TO 'almacenero'@'%';
GRANT select, update, insert ON paquete_recogido TO 'almacenero'@'%';
GRANT select ON usuario TO 'almacenero'@'%';
GRANT select, update, insert ON carga_bulto TO 'almacenero'@'%';
GRANT select, update, insert ON carga_bulto_fin TO 'almacenero'@'%';
GRANT select, update, insert ON carga_paquete TO 'almacenero'@'%';
GRANT select, update, insert ON carga_paquete_fin TO 'almacenero'@'%';
