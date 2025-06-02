CREATE DEFINER=`root`@`localhost` PROCEDURE `LiberarHabitacion`(
	IN p_id_reserva INT
)
BEGIN
	DECLARE	v_id_habitacion INT;
    
    SELECT id_habitacion INTO v_id_habitacion
    FROM RESERVAS
    WHERE id_reserva = p_id_reserva;
    
    UPDATE HABITACIONES
    SET estado = 'disponible'
    WHERE id_habitacion = v_id_habitacion;
END