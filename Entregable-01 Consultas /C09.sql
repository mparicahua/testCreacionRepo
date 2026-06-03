SELECT 
    TD.nombre AS "Nombre del tipo de delito",
    CD.nombre AS "Categoría",
    COUNT(D.id) AS "Total de denuncias",
    ROUND((COUNT(D.id) * 100.0) / (SELECT COUNT(*) FROM denuncias), 2) AS "Porcentaje del total"
FROM denuncias D
INNER JOIN tipos_delito TD ON D.tipo_delito_id = TD.id
INNER JOIN categorias_delito CD ON TD.categoria_id = CD.id
GROUP BY TD.id, TD.nombre, CD.nombre
HAVING COUNT(D.id) > 0
ORDER BY "Total de denuncias" DESC;