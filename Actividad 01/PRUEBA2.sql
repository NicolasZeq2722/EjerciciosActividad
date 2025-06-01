SET @mensaje = 'klwejdpw';
SET @multa = 50.0;
CALL registrar_devolucion(40, '2025-10-22', @mensaje, @multa);
SELECT @mensaje AS Mensaje, @multa AS Multa;