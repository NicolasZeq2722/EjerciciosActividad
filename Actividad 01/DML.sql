INSERT INTO USUARIO (Identificacion_Cliente, Estado_Cuenta, Nombre, Apellido, Telefono, Correo, Fecha_Registro) VALUES
    ('123456789', 'Activa', 'Juan', 'Pérez', 1234567890, 'juan.perez@email.com', '2025-01-01'),
    ('723847923', 'Inactiva', 'David', 'Gutierrez', 1234567890, 'David@email.com', '2025-01-01'),
    ('983743974', 'Activa', 'Jossimar', 'Gómez', 1234567890, 'jossimar@email.com', '2025-12-01');

INSERT INTO ADMINISTRADOR (Nombre, Apellido, Contraseña, Correo) VALUES 
    ('Ana', 'López', 'securepass123', 'ana.lopez@biblio.com'),
    ('Beatriz', 'Barrera', 'securepass124', 'barrera.lopez@biblio.com');

INSERT INTO EDITORIAL (Nombre, Contacto, Telefono, Correo) VALUES 
    ('Planeta', 'Sr. García', '5551234567', 'contacto@planeta.com'),
    ('Alianza Editorial', 'Gerald Durrell', '5599234567', 'AlianzaEdi@editorial.com'),
    ('Penguin', 'Sra. Díaz', '5559876543', 'info@penguin.com');

INSERT INTO AUTOR (Nombre_Autor, Apellido_Autor) VALUES 
    ('Isabel', 'Allende'),
    ('Franz', 'Kafka'),
    ('Gabriel', 'García Márquez');

INSERT INTO GENEROS (Nombre) VALUES
	('dramático'),
    ('didáctico'),
    ('poético'),
    ('narrativo'),
    ('lírico');

INSERT INTO LIBRO (Editorial_ID, Autor_ID, Generos_ID, Titulo, Ano_Publicacion, Edicion, Cantidad_Disponible, Estado, Idioma) VALUES 
    (1, 1, 1, 'Cien Años de Soledad', '1967', 'Primera', 5.00, 'Disponible', 'Español'),
    (2, 2, 2, 'La metamorfosis', '1915', 'Primera', 3.00, 'Disponible', 'Español'),
    (3, 3, 3, 'La Casa de los Espíritus', '1982', 'Segunda', 3.00, 'Disponible', 'Español');

INSERT INTO RESERVAS (Cliente_ID, Libro_ID, Fecha_Reserva, Fecha_Expiracion, Estado) VALUES 
    (1, 1, '2025-05-01', '2025-05-08', 'Activa'),
    (2, 2, '2025-05-02', '2025-05-09', 'Activa');

INSERT INTO PRESTAMO (Cliente_ID, Administrador_ID, Estado, Fecha_Devolucion_Prevista) VALUES 
    (1, 1, 'Activo', '2025-05-15 10:00:00'),
    (2, 2, 'Activo', '2025-05-16 08:40:00');

INSERT INTO MULTAS (Prestamo_ID, Monto, Fecha_Emision, Estado) VALUES 
    (1, 10.50, '2025-05-16', 'Pendiente'),
    (2, 10.50, '2025-05-16', 'Pendiente');

INSERT INTO AUDITORIA (Administrador_ID, Accion, Fecha) VALUES 
    (1, 'Creó préstamo ID 1', '2025-05-01 09:00:00'),
    (2, 'Creó préstamo ID 2', '2025-05-02 10:00:00');

INSERT INTO HISTORIAL_PRESTAMOS (Prestamo_ID, Fecha_Prestamo, Fecha_Devolucion) VALUES 
    (1, '2025-05-01', NULL),
    (2, '2025-05-02', NULL);

UPDATE USUARIO
	SET Nombre = 'Nicolas', Apellido = 'Zequea'
	WHERE Cliente_ID = 1;

UPDATE USUARIO
	SET Nombre = 'Manolo', Apellido = 'Perez'
	WHERE Cliente_ID = 2;

UPDATE ADMINISTRADOR
	SET Nombre = 'Jose', Apellido = 'Martinez'
	WHERE Administrador_ID = 1;

UPDATE ADMINISTRADOR
	SET Nombre = 'Alvarez', Apellido = 'Moreno'
	WHERE Administrador_ID = 2;

UPDATE EDITORIAL
	SET Nombre = 'Sr. Manuela'
	WHERE Editorial_ID = 1;

UPDATE EDITORIAL
	SET Nombre = 'Sr. Carlos'
	WHERE Editorial_ID = 2;

UPDATE AUTOR
	SET Nombre_Autor = 'Pedro', Apellido_Autor = 'Cruz'
	WHERE Autor_ID = 1;

UPDATE AUTOR
	SET Nombre_Autor = 'Manolo', Apellido_Autor = 'Gutierrez'
	WHERE Autor_ID = 2;

UPDATE GENEROS
	SET Nombre = 'Fantasia'
	WHERE Generos_ID = 1;

UPDATE GENEROS
	SET Nombre = 'Romance'
	WHERE Generos_ID = 2;

UPDATE LIBRO
	SET Titulo = 'Odisea', Ano_Publicacion = '1935'
	WHERE Libro_ID = 1;

UPDATE LIBRO
	SET Titulo = 'Don Quijote de la Mancha', Ano_Publicacion = '1605'
	WHERE Libro_ID = 2;

UPDATE RESERVAS
	SET Estado = 'Desactivado'
	WHERE Reserva_ID = 1;

UPDATE RESERVAS
	SET Estado = 'Desactivado'
	WHERE Reserva_ID = 2;

UPDATE PRESTAMO
	SET Estado = 'Desactivado'
	WHERE Prestamo_ID = 1;

UPDATE PRESTAMO
	SET Estado = 'Activo'
	WHERE Prestamo_ID = 2;

UPDATE MULTAS 
	SET Monto = 750.00, Fecha_Emision = '2025-12-09', Estado = 'Activo'
	WHERE Multa_ID = 1;

UPDATE MULTAS 
	SET Monto = 650.00, Fecha_Emision = '2025-12-10', Estado = 'Desactivado'
	WHERE Multa_ID = 2;

UPDATE AUDITORIA
	SET Accion = 'Se creo el prestamo', Fecha = '2025-10-20 08:30:00'
	WHERE Auditoria_ID = 1;

UPDATE AUDITORIA 
	SET Accion = 'Se creo el prestamo', Fecha = '2025-05-01 04:44:00'
	WHERE Auditoria_ID = 2;

UPDATE HISTORIAL_PRESTAMOS
	SET Fecha_Prestamo = '2025-08-24', Fecha_Devolucion = '2025-09-28'
	WHERE Historial_ID = 1;

UPDATE HISTORIAL_PRESTAMOS
	SET Fecha_Prestamo = '2025-07-17', Fecha_Devolucion = '2025-03-04'
	WHERE Historial_ID = 2;