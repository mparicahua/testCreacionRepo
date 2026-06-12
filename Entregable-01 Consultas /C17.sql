SELECT
    p.nombres || ' ' || p.apellidos            AS nombre_funcionario,
    df.nombre                                   AS distrito_fiscal,
    COUNT(CASE WHEN a.activo = true  THEN 1 END) AS total_asignadas_activas,
    COUNT(CASE WHEN a.activo = false THEN 1 END) AS total_resueltas
FROM funcionarios f
INNER JOIN personas p           ON p.id = f.persona_id
INNER JOIN distritos_fiscales df ON df.id = f.distrito_fiscal_id
LEFT JOIN asignaciones a        ON a.funcionario_id = f.id
GROUP BY f.id, p.nombres, p.apellidos, df.nombre
HAVING COUNT(CASE WHEN a.activo = true THEN 1 END) >= 0
ORDER BY total_asignadas_activas DESC;