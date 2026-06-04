WITH ConteoResoluciones AS (
    SELECT 
        f.id AS fiscal_id,
        p.nombres || ' ' || p.apellidos AS nombre_fiscal,
        f.especialidad,
        r.tipo_resolucion,
        COUNT(r.id) AS total_por_tipo,
        AVG(EXTRACT(DAY FROM (r.fecha_resolucion - d.fecha_hecho))) AS promedio_dias_res,
        DENSE_RANK() OVER (
            PARTITION BY f.id 
            ORDER BY COUNT(r.id) DESC, r.tipo_resolucion ASC
        ) AS ranking_frecuencia
    FROM resoluciones r
    JOIN fiscales f ON r.fiscal_id = f.id
    JOIN personas p ON f.persona_id = p.id
    JOIN denuncias d ON r.denuncia_id = d.id
    WHERE r.fecha_resolucion BETWEEN :fecha_inicio AND :fecha_fin
    GROUP BY f.id, p.nombres, p.apellidos, f.especialidad, r.tipo_resolucion
)
SELECT 
    nombre_fiscal,
    especialidad,
    SUM(total_por_tipo) AS total_resueltas,
    MAX(CASE WHEN ranking_frecuencia = 1 THEN tipo_resolucion END) AS tipo_de_resolucion_mas_frecuente,
    ROUND(AVG(promedio_dias_res), 2) AS promedio_de_dias_para_resolver
FROM ConteoResoluciones
GROUP BY nombre_fiscal, especialidad
HAVING SUM(total_por_tipo) >= 1;