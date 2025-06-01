CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_prestamo`(
	IN p_cliente_id INT,
    IN p_administrador_id INT,
    IN p_libro_id INT,
    IN p_fecha_prestamo DATE,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
	DECLARE libro_disponible BOOLEAN;
    DECLARE nuevo_prestamo_id INT;
    
    SET libro_disponible = fn_verificar_disponibilidad_libro(p_libro_id);
    
    IF libro_disponible THEN
        INSERT INTO PRESTAMO (Cliente_ID, Administrador_ID, Estado, Fecha_Devolucion_Prevista)
        VALUES (p_cliente_id, p_administrador_id, 'Activo', DATE_ADD(p_fecha_prestamo, INTERVAL 7 DAY));
        
        SET nuevo_prestamo_id = LAST_INSERT_ID();
        
        INSERT INTO HISTORIAL_PRESTAMOS (Prestamo_ID, Fecha_Prestamo, Fecha_Devolucion)
        VALUES (nuevo_prestamo_id, p_fecha_prestamo, NULL);
        
        SET p_mensaje = 'Préstamo registrado exitosamente.';
    ELSE
        SET p_mensaje = 'Error: El libro no está disponible.';
END if;
END