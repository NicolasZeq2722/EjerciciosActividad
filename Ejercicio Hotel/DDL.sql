DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE HABITACIONES (
	id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    capacidad  INT NOT NULL,
    estado ENUM('disponible', 'ocupada') DEFAULT 'disponible',
    precio_base DECIMAL(10.2) NOT NULL
);


CREATE TABLE CLIENTES (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);


CREATE TABLE RESERVAS (
	id_reservas INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_habitacion INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    fecha_reserva DATE NOT NULL,
    costo_total DECIMAL (10.2) NOT NULL,
    descuento_aplicado DECIMAL (10.2) DEFAULT 0.00
);

ALTER TABLE RESERVAS
ADD CONSTRAINT fk_reserva_cliente
FOREIGN KEY (id_cliente) REFERENCES CLIENTES (id_cliente);

ALTER TABLE RESERVAS
ADD CONSTRAINT fk_reserva_habitacion
FOREIGN KEY (id_habitacion) REFERENCES HABITACIONES (id_habitacion);