CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarReserva`(
    IN p_id_cliente INT,
    IN p_id_habitacion INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_fecha_reserva DATE
)
BEGIN 
    DECLARE v_costo_total DECIMAL(10, 2);
    DECLARE v_descuento_aplicado DECIMAL(5, 2);

    IF (SELECT estado FROM Habitaciones WHERE id_habitacion = p_id_habitacion) = 'disponible' THEN
        SET v_costo_total = CalcularCostoReserva(p_id_habitacion, p_fecha_inicio, p_fecha_fin, p_fecha_reserva);
        SET v_descuento_aplicado = IF(DATEDIFF(p_fecha_inicio, p_fecha_reserva) >= 15, 10.00, 0.00);
        
        INSERT INTO Reservas (id_cliente, id_habitacion, fecha_inicio, fecha_fin, fecha_reserva, costo_total, descuento_aplicado)
        VALUES (p_id_cliente, p_id_habitacion, p_fecha_inicio, p_fecha_fin, p_fecha_reserva, v_costo_total, v_descuento_aplicado);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La habitacion no esta disponible';
    END IF;
END