create schema carpisoft;
use carpisoft;

create table usuario(
id bigint unsigned auto_increment not null,
username varchar(32) not null,
password varchar(256) not null,
nombre varchar(32) not null,
apellido varchar(32) not null,
primary key (id),
UNIQUE (username)
);

create table informacion(
id bigint unsigned auto_increment not null,
id_usuario bigint unsigned not null,
tipo varchar(16) not null,
detalle varchar(256) not null,
primary key (id),
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

create table administrador(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id)
);

create table chofer(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id)
);

create table almacenero(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id)
);

create table ubicacion(
id bigint unsigned auto_increment not null,
direccion varchar(256) not null,
codigo_postal varchar(8) not null,
latitud decimal(10,8) not null,
longitud decimal(10,8) not null,
primary key (id)
);

create table almacen(
id bigint unsigned auto_increment not null,
espacio int not null,
espacio_ocupado int not null,
id_ubicacion bigint unsigned not null,
primary key (id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);

create table gestiona(
id bigint unsigned auto_increment not null,
id_usuario bigint unsigned not null,
fecha_inicio timestamp not null,
id_almacen bigint unsigned not null,
primary key (id),
UNIQUE (id_usuario, fecha_inicio),
FOREIGN KEY (id_usuario) REFERENCES almacenero(id),
FOREIGN KEY (id_almacen) REFERENCES almacen(id)
);

create table gestiona_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES gestiona(id)
);

create table bulto(
id bigint unsigned auto_increment not null,
fecha_armado timestamp not null,
volumen int not null,
peso int not null,
almacen_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (almacen_destino) REFERENCES almacen(id)
);

create table bulto_desarmado(
id bigint unsigned not null,
fecha_desarmado timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES bulto(id)
);

create table paquete(
id bigint unsigned auto_increment not null,
fecha_despacho timestamp not null,
peso int not null,
volumen int not null,
primary key (id)
);

create table paquete_para_recoger(
id bigint unsigned not null,
almacen_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete(id),
FOREIGN KEY (almacen_destino) REFERENCES almacen(id)
);

create table paquete_recogido(
id bigint unsigned not null,
fecha_recogido timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete_para_recoger(id)
);

create table paquete_para_entregar(
id bigint unsigned not null,
ubicacion_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete(id),
FOREIGN KEY (ubicacion_destino) REFERENCES ubicacion(id)
);

create table paquete_entregado(
id bigint unsigned not null,
fecha_entregado timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete_para_entregar(id)
);

create table almacen_contiene_bulto(
id bigint unsigned auto_increment not null,
id_bulto bigint unsigned not null,
fecha_inicio timestamp not null,
id_almacen bigint unsigned not null,
primary key (id),
UNIQUE(id_bulto, fecha_inicio),
FOREIGN KEY (id_bulto) REFERENCES bulto(id),
FOREIGN KEY (id_almacen) REFERENCES almacen(id)
);

create table almacen_contiene_bulto_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES almacen_contiene_bulto(id)
);

create table almacen_contiene_paquete(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_almacen bigint unsigned not null,
primary key (id),
UNIQUE(id_paquete, fecha_inicio),
FOREIGN KEY (id_paquete) REFERENCES paquete(id),
FOREIGN KEY (id_almacen) REFERENCES almacen(id)
);

create table almacen_contiene_paquete_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES almacen_contiene_paquete(id)
);

create table bulto_contiene(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_bulto bigint unsigned not null,
primary key (id),
FOREIGN KEY (id_paquete) REFERENCES paquete(id),
FOREIGN KEY (id_bulto) REFERENCES bulto(id)
);

create table bulto_contiene_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES bulto_contiene(id)
);

create table vehiculo(
id bigint unsigned auto_increment not null,
codigo_pais varchar(3) not null,
matricula varchar(16) not null,
capacidad_volumen int not null,
capacidad_peso int not null,
peso_ocupado int not null,
volumen_ocupado int not null,
primary key (id),
UNIQUE(codigo_pais, matricula)
);

create table camion(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES vehiculo(id)
);

create table camioneta(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES vehiculo(id)
);

create table maneja(
id bigint unsigned auto_increment not null,
id_vehiculo bigint unsigned not null,
id_usuario bigint unsigned not null,
fecha_inicio timestamp not null,
primary key (id),
UNIQUE(id_vehiculo, fecha_inicio),
FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id),
FOREIGN KEY (id_usuario) REFERENCES chofer(id)
);

create table maneja_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES maneja(id)
);

create table carga_bulto(
id bigint unsigned auto_increment not null,
id_bulto bigint unsigned not null,
fecha_inicio timestamp not null,
id_vehiculo bigint unsigned not null,
primary key (id),
UNIQUE(id_bulto, fecha_inicio),
FOREIGN KEY (id_bulto) REFERENCES bulto(id),
FOREIGN KEY (id_vehiculo) REFERENCES camion(id)
);

create table  carga_bulto_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES carga_bulto(id)
);

create table carga_paquete(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_vehiculo bigint unsigned not null,
primary key (id),
UNIQUE(id_paquete, fecha_inicio),
FOREIGN KEY (id_paquete) REFERENCES paquete(id),
FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id)
);

create table  carga_paquete_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES carga_paquete(id)
);

SELECT u.username, v.matricula, p.*
FROM usuario AS u
INNER JOIN chofer AS c ON u.id = c.id
INNER JOIN maneja AS m ON c.id = m.id_usuario
INNER JOIN vehiculo AS v ON m.id_vehiculo = v.id
INNER JOIN carga_paquete AS cp ON v.id = cp.id_vehiculo
INNER JOIN paquete AS p ON cp.id_paquete = p.id
INNER JOIN paquete_entregado AS pe ON p.id = pe.id
WHERE c.id = 1;

##poblando tablas##

/*INSERT INTO usuario (id, username, password, nombre, apellido)
VALUES
  (1, 'sosam', '1234567', 'Martín', 'Sosa'),
  (2, 'manu', '123567', 'Manuel', 'Rodriguez'),
  (3, 'dino', 'eldino', 'Sandino', 'López'),
  (4, 'leborges', 'flash123', 'Bruno', 'Borges');
select * from usuario

INSERT INTO informacion (id, id_usuario, tipo, detalle)
VALUES
	(1,1, 'email', 'sosam1763@gmail.com'),
    (2,2, 'telefono', '2230056'),
    (3,3, 'email', 'uri.sandi.maxi@gmail.com'),
    (4,4, 'telefono', '2335345');
select * from informacion;

INSERT INTO administrador (id)
VALUES
	(1);
select * from administrador;

INSERT INTO chofer (id)
VALUES
	(2);
select * from chofer;

INSERT INTO almacenero (id)
VALUES
	(3),
	(4);
select * from almacenero;

INSERT INTO ubicacion (id, direccion, codigo_postal, latitud, longitud)
VALUES
	(1, 'vilardebo 2027', '11800', -34.87958215828094, -56.17532811264501),
	(2, 'Ellauri 567', '11000', -34.92091607877739, -56.15718447790933),
	(3, 'Pablo de maria 1834', '11000', -34.90728446683202, -56.17073820118684),
    ('cufre 4353', 11800, -34.871650126206546, -56.162311988331574),
    ('av italia 2311', 1100, -34.864079790203526, -56.172568755213554),
    ('bv artigas 5532', 1100, -34.857565222318385, -56.180422262909794);
select * from ubicacion;


INSERT INTO almacen (id, espacio, espacio_ocupado, id_ubicacion)
VALUES
	(1, 10000, 7000, 1),
    (2, 5000, 2500, 2),
	(3, 10000, 6500, 3);

select * from almacen;


INSERT INTO gestiona (id_usuario, fecha_inicio, id_almacen)
VALUES
  (3, '2023-04-15 10:00:00', 1),
  (4, '2023-05-20 14:30:00', 2),
  (3, '2023-06-10 09:15:00', 3),
  (4, '2023-07-05 16:45:00', 1),
  (3, '2023-08-12 11:20:00', 2);

select * from gestiona;

INSERT INTO gestiona_fin (id, fecha_fin)
VALUES
  (11, '2023-04-16 10:20:00'),
  (12, '2023-05-21 14:10:00'),
  (13, '2023-06-11 09:35:00'),
  (14, '2023-07-06 17:00:00'),
  (15, '2023-08-13 11:40:00');
  
select * from gestiona_fin;

INSERT INTO bulto (fecha_armado, volumen, peso, almacen_destino)
VALUES
  ('2023-09-16 10:00:00', 10, 20, 1),
  ('2023-09-16 11:30:00', 15, 25, 2),
  ('2023-09-16 13:15:00', 12, 18, 3),
  ('2023-09-16 14:45:00', 8, 12, 1),
  ('2023-09-16 16:20:00', 20, 30, 2);

select * from bulto;

INSERT INTO bulto_desarmado (id, fecha_desarmado)
VALUES
	(1, '2023-09-22 10:00:00'),
    (2, '2023-09-23 11:30:00'),
    (3, '2023-09-25 13:15:00'),
    (4, '2023-09-19 14:45:00'),
    (5, '2023-09-20 16:20:00');
select * from bulto_desarmado;

INSERT INTO paquete (fecha_despacho, peso, volumen)
VALUES
  ('2023-09-17 10:00:00', 5, 8),
  ('2023-09-17 11:30:00', 7, 10),
  ('2023-09-17 13:15:00', 12, 18),
  ('2023-09-17 14:45:00', 3, 5),
  ('2023-09-17 16:20:00', 6, 9);

select * from paquete;

INSERT INTO paquete_para_recoger (id, almacen_destino)
VALUES
	(1, 2),
    (3, 3);
select * from paquete_para_recoger;

INSERT INTO paquete_recogido (id, fecha_recogido)
VALUES
	(1,'2023-09-22 14:25:00');

select * from paquete_recogido;

INSERT INTO paquete_para_entregar (id, ubicacion_destino)
VALUES
	(2, 4),
    (4, 5),
    (5, 6);
select * from paquete_para_entregar;

INSERT INTO paquete_entregado (id, fecha_entregado)
VALUES
	(2, '2023-09-27 16:25:00'),
	(5, '2023-09-28 17:05:00');
select * from paquete_entregado;

INSERT INTO almacen_contiene_bulto (id_bulto, fecha_inicio, id_almacen)
VALUES
	(1, '2023-09-17 10:00:00',1),
    (2, '2023-09-18 11:30:00',2);
    
select * from almacen_contiene_bulto;

INSERT INTO almacen_contiene_bulto_fin (id, fecha_fin)
VALUES
	(1, '2023-09-17 10:30:00'),
    (2, '2023-09-17 11:00:00');
select * from almacen_contiene_bulto_fin;

INSERT INTO almacen_contiene_paquete (id_paquete, fecha_inicio, id_almacen)
VALUES
	(1, '2023-09-17 10:00:00', 2),
	(2, '2023-09-17 13:15:00', 1);
select * from almacen_contiene_paquete;

INSERT INTO almacen_contiene_paquete_fin (id, fecha_fin)
VALUES
	(1, '2023-09-19 11:00:00'),
	(2, '2023-09-22 11:00:00');
select * from almacen_contiene_paquete_fin;

INSERT INTO bulto_contiene (id_paquete, fecha_inicio, id_bulto)
VALUES
	(1,'2023-09-17 11:00:00', 2),
	(2,'2023-09-17 12:30:00', 1),
    (3,'2023-09-17 15:15:00', 1);

select * from bulto;
select * from paquete;
select * from bulto_contiene;

INSERT INTO bulto_contiene_fin (id, fecha_fin)
VALUES
	(1,'2023-09-18 11:00:00'),
	(2,'2023-09-17 18:30:00'),
	(3,'2023-09-17 18:30:00');
select * from bulto_contiene_fin;

INSERT INTO vehiculo (codigo_pais, matricula, capacidad_volumen, capacidad_peso, peso_ocupado, volumen_ocupado)
VALUES
  ('UY', 'AAA-1823', 100, 1000, 0, 0),
  ('UY', 'SBZ-4562', 150, 1200, 0, 0),
  ('UY', 'ABB-7829', 200, 1500, 0, 0),
  ('UY', 'PHP-0122', 120, 900, 0, 0),
  ('UY', 'SAS-3455', 180, 800, 0, 0),
  ('UY', 'FIA-6738', 90, 600, 0, 0),
  ('UY', 'OLS-9031', 160, 1100, 0, 0),
  ('UY', 'SBZ-2364', 140, 950, 0, 0),
  ('UY', 'AAA-5674', 110, 750, 0, 0),
  ('UY', 'VPI-8902', 170, 1300, 0, 0);
select * from vehiculo;

INSERT INTO camion (id)
VALUES 
	(1),
    (2),
    (3),
    (4),
    (5),
    (6);
select * from camion;

INSERT INTO camioneta (id)
VALUES
	(7),
    (8),
    (9),
    (10);
select * from camioneta;

INSERT INTO maneja (id_vehiculo, id_usuario, fecha_inicio)
VALUES
	(1,2, '2023-09-17 12:30:00'),
    (2,2, '2023-09-18 12:30:00'),
	(3,2, '2023-09-19 18:30:00');
select * from maneja;

INSERT INTO maneja_fin(id, fecha_fin)
VALUES
	(1, '2023-09-17 14:30:00'),
    (2, '2023-09-17 13:30:00'),
    (3, '2023-09-17 16:30:00');
select * from maneja_fin;

INSERT INTO carga_bulto (id_bulto, fecha_inicio, id_vehiculo)
VALUES
	(1,'2023-09-17 12:20:00',1),
    (2,'2023-09-18 12:20:00',2),
	(3,'2023-09-19 18:20:00',3);
select * from carga_bulto;

INSERT INTO carga_bulto_fin (id, fecha_fin)
VALUES	
	(1, '2023-09-17 14:25:00'),
    (2, '2023-09-17 13:25:00'),
    (3, '2023-09-17 18:25:00');
select * from carga_bulto_fin;

INSERT INTO carga_paquete (id_paquete, fecha_inicio, id_vehiculo)
VALUES
	(1,'2023-09-13 12:20:00',4),
    (2,'2023-09-15 12:20:00',5),
	(3,'2023-09-12 18:20:00',6);
select * from carga_paquete;

INSERT INTO carga_paquete_fin (id, fecha_fin)
VALUES	
	(1, '2023-09-13 14:25:00'),
    (2, '2023-09-15 13:25:00'),
    (3, '2023-09-12 20:25:00');
select * from carga_paquete_fin;

###fin poblado de tablas###

*/
