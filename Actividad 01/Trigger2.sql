DELIMITER //
CREATE TRIGGER tr_actualizar_estado_libro_devolucion
AFTER UPDATE ON HISTORIAL_PRESTAMOS
FOR EACH ROW
BEGIN
    IF NEW.Fecha_Devolucion IS NOT NULL THEN
        UPDATE LIBRO
        SET Cantidad_Disponible = Cantidad_Disponible + 1,
            Estado = 'Disponible'
        WHERE Libro_ID = (SELECT Libro_ID FROM PRESTAMO WHERE Prestamo_ID = NEW.Prestamo_ID);
    END IF;
END //
DELIMITER ;