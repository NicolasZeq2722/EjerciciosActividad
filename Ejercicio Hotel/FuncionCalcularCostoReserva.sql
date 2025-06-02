CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularCostoReserva`(p_id_habitacion INT,
    p_fecha_inicio DATE,
    p_fecha_fin DATE,
    p_fecha_reserva DATE
) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
	DECLARE v_precio_base DECIMAL(10.2);
    DECLARE v_dias INT;
    DECLARE v_costo DECIMAL(10.2);
    
    SELECT precio_base INTO v_precio_base
    FROM HABITACIONES
    WHERE id_habitacion = p_id_habitacion;
    
    SET v_dias = DATEDIFF(p_fecha_fin, p_fecha_inicio);
    SET v_costo = v_precio_base * v_dias;
    
    IF DATEDIFF(p_fecha_inicio, p_fecha_reserva) >= 15 THEN
		SET v_costo = v_costo * 0.90;
	END IF;
RETURN v_costo;
END