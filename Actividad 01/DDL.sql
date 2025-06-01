DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE USUARIO (
    Cliente_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Identificacion_Cliente VARCHAR(50),
    Estado_Cuenta VARCHAR(50),
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Telefono INTEGER(10),
    Correo VARCHAR(255),
    Fecha_Registro DATE
);

CREATE TABLE ADMINISTRADOR (
    Administrador_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Contraseña VARCHAR(255),
    Correo VARCHAR(255)
);

CREATE TABLE EDITORIAL (
    Editorial_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Contacto VARCHAR(255),
    Telefono VARCHAR(255),
    Correo VARCHAR(255)
);

CREATE TABLE AUTOR (
    Autor_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre_Autor VARCHAR(255),
    Apellido_Autor VARCHAR(255)
);

CREATE TABLE GENEROS (
    Generos_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50)
);

CREATE TABLE LIBRO (
    Libro_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Editorial_ID INTEGER(10),
    Autor_ID INTEGER(10),
    Generos_ID INTEGER(10),
    Titulo VARCHAR(255),
    Ano_Publicacion VARCHAR(4),
    Edicion VARCHAR(50),
    Cantidad_Disponible DOUBLE(10, 2),
    Estado VARCHAR(50),
    Idioma VARCHAR(50),
    CONSTRAINT fk_libro_editorial FOREIGN KEY (Editorial_ID) REFERENCES EDITORIAL(Editorial_ID),
    CONSTRAINT fk_libro_autor FOREIGN KEY (Autor_ID) REFERENCES AUTOR(Autor_ID),
    CONSTRAINT fk_libro_generos FOREIGN KEY (Generos_ID) REFERENCES GENEROS(Generos_ID)
);

CREATE TABLE RESERVAS (
    Reserva_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INTEGER(10),
    Libro_ID INTEGER(10),
    Fecha_Reserva DATE,
    Fecha_Expiracion DATE,
    Estado VARCHAR(50),
    CONSTRAINT fk_reservas_usuario FOREIGN KEY (Cliente_ID) REFERENCES USUARIO(Cliente_ID),
    CONSTRAINT fk_reservas_libro FOREIGN KEY (Libro_ID) REFERENCES LIBRO(Libro_ID)
);

CREATE TABLE PRESTAMO (
    Prestamo_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INTEGER(10),
    Administrador_ID INTEGER(10),
    Estado VARCHAR(50),
    Fecha_Devolucion_Prevista TIMESTAMP,
    CONSTRAINT fk_prestamo_usuario FOREIGN KEY (Cliente_ID) REFERENCES USUARIO(Cliente_ID),
    CONSTRAINT fk_prestamo_administrador FOREIGN KEY (Administrador_ID) REFERENCES ADMINISTRADOR(Administrador_ID)
);

CREATE TABLE MULTAS (
    Multa_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Prestamo_ID INTEGER(10),
    Monto DECIMAL(10, 2),
    Fecha_Emision DATE,
    Estado VARCHAR(50),
    CONSTRAINT fk_multas_prestamo FOREIGN KEY (Prestamo_ID) REFERENCES PRESTAMO(Prestamo_ID)
);

CREATE TABLE AUDITORIA (
    Auditoria_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Administrador_ID INTEGER(10),
    Accion VARCHAR(255),
    Fecha TIMESTAMP,
    CONSTRAINT fk_auditoria_administrador FOREIGN KEY (Administrador_ID) REFERENCES ADMINISTRADOR(Administrador_ID)
);

CREATE TABLE HISTORIAL_PRESTAMOS (
    Historial_ID INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    Prestamo_ID INTEGER(10),
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    CONSTRAINT fk_historial_prestamo FOREIGN KEY (Prestamo_ID) REFERENCES PRESTAMO(Prestamo_ID)
);