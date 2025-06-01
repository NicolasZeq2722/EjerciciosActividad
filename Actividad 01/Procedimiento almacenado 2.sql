CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_devolucion`(
	IN p_prestamo_id INT,
    IN p_fecha_devolucion DATE,
    out p_mensaje VARCHAR(255),
    OUT p_multa DECIMAL(10,2)
)
BEGIN
	DECLARE fecha_prestamo DATE;
    SELECT Fecha_Prestamo INTO fecha_prestamo
    FROM HISTORIAL_PRESTAMOS
    WHERE Prestamo_ID = p_prestamo_id;
    
    SET p_multa = Biblioteca.fn_calcular_multa(fecha_prestamo, p_fecha_devolucion);
    
    UPDATE HISTORIAL_PRESTAMOS
    SET Fecha_Devolucion = p_fecha_devolucion
    WHERE Prestamo_ID = p_prestamo_id;
    
    UPDATE PRESTAMO
    SET Estado = 'Completado'
    WHERE Prestamo_ID = p_prestamo_id;
    
    IF p_multa > 0 THEN
        INSERT INTO MULTAS (Prestamo_ID, Monto, Fecha_Emision, Estado)
        VALUES (p_prestamo_id, p_multa, p_fecha_devolucion, 'Pendiente');
        SET p_mensaje = CONCAT('Devolución registrada. Multa aplicada: $', p_multa);
    ELSE
        SET p_mensaje = 'Devolución registrada. No hay multa.';
    END IF;
END