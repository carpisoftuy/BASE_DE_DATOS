use carpifast;
create table usuario(
id_usuario bigint unsigned auto_increment not null,
username varchar(32) unique not null,
password varchar (256) not null,
nombre varchar(32) not null,
apellido varchar(32) not null,
primary key (id_usuario)
);

create table informacion(
id bigint unsigned auto_increment not null,
id_usuario bigint unsigned not null,
tipo varchar(16) unique not null,
detalle varchar (256) not null,
primary key (id),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table administrador(
id bigint unsigned auto_increment not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id_usuario)
);

create table chofer(
id bigint unsigned auto_increment not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id_usuario)
);

create table almacenero(
id bigint unsigned auto_increment not null,
primary key (id),
FOREIGN KEY (id) REFERENCES usuario(id_usuario)
);

create table ubicacion(
id bigint unsigned auto_increment not null,
direccion varchar(256)not null,
codigo_postal varchar(8)not null,
latitud decimal(10,8)not null,
longuitud decimal(10,8)not null,
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
id_usuario bigint unsigned not null unique,
fecha_inicio timestamp unique not null,
id_almacen bigint unsigned not null not null,
primary key (id),
FOREIGN KEY (id_usuario) REFERENCES almacenero(id),
FOREIGN KEY (id_almacen) REFERENCES almacen(id)
);

create table gestiona_fin(
id bigint unsigned auto_increment not null,
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
id bigint unsigned auto_increment not null,
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
id bigint unsigned auto_increment not null,
almacen_destino bigint unsigned not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete(id),
FOREIGN KEY (almacen_destino) REFERENCES almacen(id)
);

create table paquete_recogido(
id bigint unsigned auto_increment not null,
fecha_recogido timestamp not null,
primary key (id),
FOREIGN KEY (id) REFERENCES paquete_para_recoger(id)
);

