SELECT
    df.nombre AS distrito_fiscal,
    ROUND(AVG(EXTRACT(EPOCH FROM (he_admitida.created_at - he_ingresada.created_at)) / 86400.0), 2) AS promedio_dias,
    ROUND(MIN(EXTRACT(EPOCH FROM (he_admitida.created_at - he_ingresada.created_at)) / 86400.0), 2) AS minimo_dias,
    ROUND(MAX(EXTRACT(EPOCH FROM (he_admitida.created_at - he_ingresada.created_at)) / 86400.0), 2) AS maximo_dias,COUNT(*) AS total_denuncias
FROM denuncias d
INNER JOIN distritos_fiscales df ON df.id = d.distrito_fiscal_id

-- Primera vez que la denuncia pasó a estado INGRESADA
INNER JOIN (
    SELECT
        he.denuncia_id,
        MIN(he.created_at) AS created_at
    FROM historial_estados he
    INNER JOIN estados_denuncia ed ON ed.id = he.estado_nuevo_id
    WHERE ed.nombre = 'INGRESADA'
    GROUP BY he.denuncia_id
) he_ingresada ON he_ingresada.denuncia_id = d.id

-- Primera vez que la denuncia pasó a estado ADMITIDA
INNER JOIN (
    SELECT
        he.denuncia_id,
        MIN(he.created_at) AS created_at
    FROM historial_estados he
    INNER JOIN estados_denuncia ed ON ed.id = he.estado_nuevo_id
    WHERE ed.nombre = 'ADMITIDA'
    GROUP BY he.denuncia_id
) he_admitida ON he_admitida.denuncia_id = d.id

WHERE d.created_at BETWEEN '2025-01-01'
                        AND '2026-12-31 23:59:59'
  AND he_admitida.created_at > he_ingresada.created_at

GROUP BY df.id, df.nombre
HAVING COUNT(*) >= 5
ORDER BY promedio_dias ASC;
