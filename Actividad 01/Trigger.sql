DELIMITER //
CREATE TRIGGER tr_actualizar_estado_libro
AFTER INSERT ON HISTORIAL_PRESTAMOS
FOR EACH ROW
BEGIN
    UPDATE LIBRO
    SET Cantidad_Disponible = Cantidad_Disponible - 1,
        Estado = IF(Cantidad_Disponible - 1 = 0, 'No Disponible', 'Disponible')
    WHERE Libro_ID = (SELECT Libro_ID FROM PRESTAMO WHERE Prestamo_ID = NEW.Prestamo_ID);
END //
DELIMITER ;