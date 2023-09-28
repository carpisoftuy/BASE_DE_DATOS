##poblando tablas##

INSERT INTO usuario (username, password, nombre, apellido)
VALUES
  ('sosam', '1234567', 'Martín', 'Sosa'),
  ('manu', '123567', 'Manuel', 'Rodriguez'),
  ('dino', 'eldino', 'Sandino', 'López'),
  ('leborges', 'flash123', 'Bruno', 'Borges');
select * from usuario;

INSERT INTO informacion (id_usuario, tipo, detalle)
VALUES
	(1, 'email', 'sosam1763@gmail.com'),
    (2, 'telefono', '2230056'),
    (3, 'email', 'uri.sandi.maxi@gmail.com'),
    (4, 'telefono', '2335345');
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

INSERT INTO ubicacion (direccion, codigo_postal, latitud, longitud)
VALUES
	('vilardebo 2027', '11800', -34.87958215828094, -56.17532811264501),
	('Ellauri 567', '11000', -34.92091607877739, -56.15718447790933),
	('Pablo de maria 1834', '11000', -34.90728446683202, -56.17073820118684),
    ('cufre 4353', 11800, -34.871650126206546, -56.162311988331574),
    ('av italia 2311', 1100, -34.864079790203526, -56.172568755213554),
    ('bv artigas 5532', 1100, -34.857565222318385, -56.180422262909794);
select * from ubicacion;


INSERT INTO almacen (espacio, espacio_ocupado, id_ubicacion)
VALUES
	(10000, 7000, 1),
    (5000, 2500, 2),
	(10000, 6500, 3);

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
  (1, '2023-04-16 10:20:00'),
  (2, '2023-05-21 14:10:00'),
  (3, '2023-06-11 09:35:00'),
  (4, '2023-07-06 17:00:00'),
  (5, '2023-08-13 11:40:00');
  
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
	(3,2, '2023-09-18 12:30:00'),
	(4,2, '2023-09-18 12:30:00'),
	(5,2, '2023-09-18 12:30:00'),
	(6,2, '2023-09-19 16:30:00');
select * from maneja;

INSERT INTO maneja_fin(id, fecha_fin)
VALUES
	(1, '2023-09-17 13:30:00'),
    	(2, '2023-09-18 13:30:00'),
	(3, '2023-09-18 13:30:00'),
	(4, '2023-09-18 13:30:00'),
	(5, '2023-09-18 13:30:00'),
	(6, '2023-09-19 17:30:00');
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
	(2,'2023-09-17 18:20:00',6);
select * from carga_paquete;

INSERT INTO carga_paquete_fin (id, fecha_fin)
VALUES	
	(1, '2023-09-13 14:25:00'),
    (2, '2023-09-15 13:25:00'),
    (3, '2023-09-17 20:25:00');
select * from carga_paquete_fin;

###fin poblado de tablas###
