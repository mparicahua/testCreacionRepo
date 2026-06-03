SELECT 
    TD.nombre AS nombre_del_tipo_delito,
    CD.nombre AS categoria,
    COUNT(D.id) AS total_denuncias,
    ROUND((COUNT(D.id) * 100.0) / (SELECT COUNT(*) FROM denuncias), 2) AS porcentaje
FROM denuncias D
INNER JOIN tipos_delito TD ON D.tipo_delito_id = TD.id
INNER JOIN categorias_delito CD ON TD.categoria_id = CD.id
WHERE 1 = 1
    -- AND D.fecha_hecho >= '2026-01-01 00:00:00'
    -- AND D.fecha_hecho <= '2026-12-31 23:59:59'
GROUP BY TD.id, TD.nombre, CD.nombre
HAVING COUNT(D.id) > 0
ORDER BY total_denuncias DESC;