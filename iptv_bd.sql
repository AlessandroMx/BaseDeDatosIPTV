-- Crear base de datos para el sistema de televisión por IP
CREATE DATABASE iptv;

-- Seleccionamos base de datos para crear su estructura
USE iptv;

-- Crear tablas

-- Tabla donde se almacenan las tarjetas de crédito/débito de los usuarios
CREATE TABLE `Tarjeta` (
  `numero_tarjeta` varchar(16) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `fecha` varchar(5) NOT NULL,
  PRIMARY KEY (`numero_tarjeta`)
);

-- Tabla con los paquetes registrados en sistema y descripción de lo que tienen
CREATE TABLE `Paquete` (
  `id_paquete` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(13,2) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_paquete`)
);

-- Tabla para clientes con sus datos y llave foránea a tabla Tarjeta
CREATE TABLE `Cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `numero_tarjeta` varchar(16),
  `id_paquete` int,
  PRIMARY KEY (`id_cliente`),
  FOREIGN KEY (`numero_tarjeta`) REFERENCES `Tarjeta`(`numero_tarjeta`),
  FOREIGN KEY (`id_paquete`) REFERENCES `Paquete`(`id_paquete`)
);

-- Tabla principal donde se conecta todas las tablas con la solicitud a completar
-- Cada solicitud tiene relación con un cliente y un paquete
-- La fecha en la que se genera la solicitud se establece automáticamente
CREATE TABLE `Solicitud` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_paquete` int NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_solicitud`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`),
  FOREIGN KEY (`id_paquete`) REFERENCES `Paquete`(`id_paquete`)
);

-- Insertar registros de prueba

-- NOTA: Al agregar un cliente, primero debe darse de alta su tarjeta de
-- débito o crédito en la base de datos

-- Agregar registro de tarjeta de crédito/débito
INSERT INTO Tarjeta (numero_tarjeta, cvv, fecha)
VALUES ('9999000099990000', '111', '11/22');

-- Agregar registro de usuario
INSERT INTO Cliente (nombre, apellido_paterno, apellido_materno, calle, ciudad, codigo_postal, telefono, correo, numero_tarjeta)
VALUES ('John', 'Doe', 'Moe', 'Calle Primavera', 'Querétaro', '98712', '4422116633', 'john_doe@coldmail.com', '9999000099990000');

-- Agregar algunos paquetes que provee la empresa
INSERT INTO Paquete (nombre, precio, descripcion)
VALUES ('Básico', 299.99, 'Paquete con los canales básico de nuestro servicio');
INSERT INTO Paquete (nombre, precio, descripcion)
VALUES ('Oro', 399.99, 'Paquete con los canales oro de nuestro servicio');
INSERT INTO Paquete (nombre, precio, descripcion)
VALUES ('Premium', 499.99, 'Paquete con los canales premium de nuestro servicio');

-- Agregar una solicitud 
INSERT INTO Solicitud (id_cliente, id_paquete)
VALUES (1, 2);