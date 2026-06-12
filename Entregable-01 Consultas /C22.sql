SELECT
    te.nombre                                               AS tipo_evidencia,
    COUNT(e.id)                                             AS total_archivos,
    ROUND(COUNT(e.id)::numeric /
          NULLIF((SELECT COUNT(DISTINCT denuncia_id)
                  FROM evidencias), 0), 2)                  AS promedio_por_denuncia,
    ROUND(AVG(e.tamanio_bytes) / 1048576.0, 2)             AS tamanio_promedio_mb
FROM evidencias e
INNER JOIN tipos_evidencia te ON te.id = e.tipo_id
GROUP BY te.id, te.nombre
ORDER BY total_archivos DESC;