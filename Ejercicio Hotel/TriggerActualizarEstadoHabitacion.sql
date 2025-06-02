DELIMITER //

CREATE TRIGGER ActualizarEstadoHabitacion
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET estado = 'ocupada'
    WHERE id_habitacion = NEW.id_habitacion;
END //

