-- Crear base de datos para el banco
CREATE DATABASE iptv_banco;

-- Usar la recién creada base de datos
USE iptv_banco;

-- Crear la única tabla que contendrá todos los datos de los usuarios del banco
CREATE TABLE `Usuarios` (
  `numero_tarjeta` varchar(16) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `monto` decimal(13, 2) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `fecha` varchar(5) NOT NULL,
  PRIMARY KEY (`numero_tarjeta`)
);

-- Insertar registro de usuario
INSERT INTO Usuarios (numero_tarjeta, nombre, apellido_paterno, apellido_materno, monto, cvv, fecha)
VALUES ('9999000099990000', 'John', 'Doe', 'Moe', 1000.00, '111', '11/22');