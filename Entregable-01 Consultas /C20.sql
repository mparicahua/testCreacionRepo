SELECT 
    U.departamento,
    U.provincia,
    U.distrito,
    COUNT(D.id) AS total_denuncias

FROM Denuncias D
INNER JOIN ubigeo U ON D.ubigeo_id = U.id

WHERE 1= 1
 -- Filtro con respecto a fechas:
 -- AND D.fecha_hecho >= '2026-01-01'
 -- AND D.fecha_hehco <= '2026-12-31'

GROUP BY U.id, U.departamento, U.provincia, U.distrito
HAVING COUNT(D.id) < 5
ORDER BY total_denuncias DESC;