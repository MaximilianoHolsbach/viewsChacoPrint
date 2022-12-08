DROP DATABASE IF EXISTS chaco_print;
CREATE DATABASE IF NOT EXISTS chaco_print;

USE chaco_print;

/* PERTENECE AL SEGMENTO IDENTIFICACION DE EQUIPO */

CREATE TABLE IF NOT EXISTS marca(
id_marca INT NOT NULL AUTO_INCREMENT,
nombre_marca varchar(100) NOT NULL UNIQUE,
PRIMARY KEY(id_marca)
);

CREATE TABLE IF NOT EXISTS modelo(
id_modelo INT NOT NULL AUTO_INCREMENT,
nombre_modelo varchar(100) NOT NULL UNIQUE,
id_marca INT NOT NULL,
fotocopia ENUM('si','no','NN') default 'NN',
imprime ENUM('si','no','NN') default 'NN',
escanea ENUM('si','no','NN') default 'NN',
monocromo ENUM('si','no','NN') default 'NN',
color ENUM('si','no','NN') default 'NN',
cantidad INT default 0,
PRIMARY KEY(id_modelo),
FOREIGN KEY(id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS equipo(
serie_equipo varchar(100) NOT NULL,
id_marca INT NOT NULL,
id_modelo INT NOT NULL,
contador INT default 0,
id_cliente int,
PRIMARY KEY(serie_equipo),
FOREIGN KEY(id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE,
FOREIGN KEY(id_modelo) REFERENCES modelo(id_modelo) ON DELETE CASCADE
);

/* PERTENECE AL SEGMENTO DATOS DEL CLIENTE */

CREATE TABLE IF NOT EXISTS provincia(
id_provincia INT NOT NULL AUTO_INCREMENT,
nombre_provincia varchar(100) NOT NULL UNIQUE,
PRIMARY KEY(id_provincia)
);

CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre_cliente varchar(100) NOT NULL,
direccion_cliente varchar(100) NOT NULL,
id_provincia INT NOT NULL,
sector_cliente varchar(100) NOT NULL,
PRIMARY KEY(id_cliente),
FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS telefono_cliente(
id_telefono INT NOT NULL AUTO_INCREMENT,
numero_telefono varchar(100) NOT NULL,
telefono_pertenece INT NOT NULL,
PRIMARY KEY(id_telefono),
FOREIGN KEY(telefono_pertenece) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS email_cliente(
id_email INT NOT NULL AUTO_INCREMENT,
direccion_email varchar(100),
email_pertenece INT NOT NULL,
PRIMARY KEY(id_email), 
FOREIGN KEY(email_pertenece) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);

/* PERTENECE AL SEGMENTO DATOS DE STOCK */

CREATE TABLE IF NOT EXISTS stock(
id_producto varchar(100) NOT NULL,
tipo_producto varchar(100) NOT NULL,
nombre_producto varchar(100) NOT NULL,
precio_producto float8 default 0.0,
cantidad INT default 0,
cantidad_minima INT default 0,
PRIMARY KEY(id_producto)
);

CREATE TABLE IF NOT EXISTS usado_en(
id_modelo int,
id_producto varchar(100),
PRIMARY KEY(id_producto)
);

/* PERTENECE AL SEGMENTO DATOS DE RRHH */

CREATE TABLE IF NOT EXISTS puesto(
id_puesto INT NOT NULL AUTO_INCREMENT,
nombre_puesto varchar(50) NOT NULL,
descripcion_puesto varchar(100),
PRIMARY KEY(id_puesto)
);

CREATE TABLE IF NOT EXISTS rrhh(
id_trabajador INT NOT NULL AUTO_INCREMENT,
nombre_trabajador varchar(100) NOT NULL,
apellido_trabajador varchar(100) NOT NULL,
direccion_trabajador varchar(100) NOT NULL,
telefono_trabajador varchar(100),
email_trabajador varchar(100),
puesto_trabajador INT NOT NULL,
fecha_ingreso timestamp default current_timestamp,
PRIMARY KEY(id_trabajador),
FOREIGN KEY(puesto_trabajador) REFERENCES puesto(id_puesto) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS trabajo(
id_trabajo INT NOT NULL AUTO_INCREMENT,
nombre_trabajo varchar(50) NOT NULL,
descripcion_trabajo varchar(100) NOT NULL,
PRIMARY KEY(id_trabajo)
);

/* PERTENECE AL SEGMENTO DATOS DE COMERCIALIZACION */

CREATE TABLE IF NOT EXISTS venta(
id_venta INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_producto varchar(100) NOT NULL,
id_trabajador INT NOT NULL,
id_trabajo INT NOT NULL,
fecha_venta timestamp default current_timestamp,
PRIMARY KEY(id_venta),
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
FOREIGN KEY(id_producto) REFERENCES stock(id_producto) ON DELETE CASCADE,
FOREIGN KEY(id_trabajador) REFERENCES rrhh(id_trabajador) ON DELETE CASCADE,
FOREIGN KEY(id_trabajo) REFERENCES trabajo(id_trabajo) ON DELETE CASCADE
);