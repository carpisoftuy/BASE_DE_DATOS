drop database if exists carpifast;
create database carpifast;
use carpifast;
/* las ID son porque laravel pide que sean asi*/
create table usuario(
id bigint unsigned auto_increment not null,
username varchar(32) not null,
password varchar(256) not null,
nombre varchar(32) not null,
apellido varchar(32) not null,
primary key (id),
UNIQUE (username)
);

create table administrador(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id) ON DELETE CASCADE
);

create table chofer(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id)  ON DELETE CASCADE
);

create table almacenero(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id)  ON DELETE CASCADE
);

create table ubicacion(
id bigint unsigned auto_increment not null,
direccion varchar(256) not null,
codigo_postal varchar(8) not null,
latitud decimal(11,8) not null,
longitud decimal(11,8) not null,
primary key (id)
);

create table almacen(
id bigint unsigned auto_increment not null,
espacio int not null,
espacio_ocupado int not null,
id_ubicacion bigint unsigned not null,
primary key (id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id) ON DELETE CASCADE
);

create table bulto(
id bigint unsigned auto_increment not null,
fecha_armado timestamp not null,
volumen int not null,
peso int not null,
almacen_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (almacen_destino) REFERENCES almacen(id) ON DELETE CASCADE
);

create table bulto_desarmado(
id bigint unsigned not null,
fecha_desarmado timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES bulto(id) ON DELETE CASCADE
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
FOREIGN KEY (id) REFERENCES paquete(id) ON DELETE CASCADE,
FOREIGN KEY (almacen_destino) REFERENCES almacen(id) ON DELETE CASCADE
);

create table paquete_recogido(
id bigint unsigned not null,
fecha_recogido timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete_para_recoger(id) ON DELETE CASCADE
);

create table paquete_para_entregar(
id bigint unsigned not null,
ubicacion_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete(id) ON DELETE CASCADE,
FOREIGN KEY (ubicacion_destino) REFERENCES ubicacion(id) ON DELETE CASCADE
);

create table paquete_entregado(
id bigint unsigned not null,
fecha_entregado timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete_para_entregar(id) ON DELETE CASCADE
);

create table almacen_contiene_bulto(
id bigint unsigned auto_increment not null,
id_bulto bigint unsigned not null,
fecha_inicio timestamp not null,
id_almacen bigint unsigned not null,
primary key (id),
UNIQUE(id_bulto, fecha_inicio),
FOREIGN KEY (id_bulto) REFERENCES bulto(id) ON DELETE CASCADE,
FOREIGN KEY (id_almacen) REFERENCES almacen(id) ON DELETE CASCADE
);

create table almacen_contiene_bulto_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES almacen_contiene_bulto(id) ON DELETE CASCADE
);

create table almacen_contiene_paquete(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_almacen bigint unsigned not null,
primary key (id),
UNIQUE(id_paquete, fecha_inicio),
FOREIGN KEY (id_paquete) REFERENCES paquete(id) ON DELETE CASCADE,
FOREIGN KEY (id_almacen) REFERENCES almacen(id) ON DELETE CASCADE
);

create table almacen_contiene_paquete_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES almacen_contiene_paquete(id) ON DELETE CASCADE
);

create table bulto_contiene(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_bulto bigint unsigned not null,
primary key (id),
FOREIGN KEY (id_paquete) REFERENCES paquete(id) ON DELETE CASCADE,
FOREIGN KEY (id_bulto) REFERENCES bulto(id) ON DELETE CASCADE
);

create table bulto_contiene_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES bulto_contiene(id) ON DELETE CASCADE
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
FOREIGN KEY (id) REFERENCES vehiculo(id) ON DELETE CASCADE
);

create table camioneta(
id bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES vehiculo(id) ON DELETE CASCADE
);

create table maneja(
id bigint unsigned auto_increment not null,
id_vehiculo bigint unsigned not null,
id_usuario bigint unsigned not null,
fecha_inicio timestamp not null,
primary key (id),
UNIQUE(id_vehiculo, fecha_inicio),
FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id) ON DELETE CASCADE,
FOREIGN KEY (id_usuario) REFERENCES chofer(id) ON DELETE CASCADE
);

create table maneja_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES maneja(id) ON DELETE CASCADE
);

create table carga_bulto(
id bigint unsigned auto_increment not null,
id_bulto bigint unsigned not null,
fecha_inicio timestamp not null,
id_vehiculo bigint unsigned not null,
primary key (id),
UNIQUE(id_bulto, fecha_inicio),
FOREIGN KEY (id_bulto) REFERENCES bulto(id) ON DELETE CASCADE,
FOREIGN KEY (id_vehiculo) REFERENCES camion(id) ON DELETE CASCADE
);

create table  carga_bulto_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES carga_bulto(id) ON DELETE CASCADE
);

create table carga_paquete(
id bigint unsigned auto_increment not null,
id_paquete bigint unsigned not null,
fecha_inicio timestamp not null,
id_vehiculo bigint unsigned not null,
primary key (id),
UNIQUE(id_paquete, fecha_inicio),
FOREIGN KEY (id_paquete) REFERENCES paquete(id) ON DELETE CASCADE,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id) ON DELETE CASCADE
);

create table  carga_paquete_fin(
id bigint unsigned not null,
fecha_fin timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES carga_paquete(id) ON DELETE CASCADE
);
