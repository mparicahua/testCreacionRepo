SELECT
    EXTRACT(YEAR  FROM d.created_at)::int                          AS anio,
    EXTRACT(MONTH FROM d.created_at)::int                          AS mes,
    COUNT(d.id)                                                     AS total_denuncias,
    COUNT(CASE WHEN ed.nombre = 'ADMITIDA'  THEN 1 END)            AS total_admitidas,
    COUNT(CASE WHEN ed.nombre = 'ARCHIVADA' THEN 1 END)            AS total_archivadas
FROM denuncias d
INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
WHERE EXTRACT(YEAR FROM d.created_at) = 2024
GROUP BY
    EXTRACT(YEAR  FROM d.created_at),
    EXTRACT(MONTH FROM d.created_at)
ORDER BY anio, mes;