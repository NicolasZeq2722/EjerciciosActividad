SET @mensaje = '';
CALL registrar_prestamo(1, 2, 1, '2025-09-10',@mensaje);
SELECT @mensaje AS Mensaje, @multa AS Multa;