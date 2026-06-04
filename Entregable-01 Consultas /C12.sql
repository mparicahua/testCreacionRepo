SELECT
    d.codigo_seguimiento,
    d.fecha_hecho,
    td.nombre AS tipo_delito,
    df.nombre AS distrito_fiscal
FROM denuncias d
INNER JOIN tipos_delito td ON td.id = d.tipo_delito_id
INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
LEFT JOIN distritos_fiscales df ON df.id = d.distrito_fiscal_id
WHERE NOT EXISTS (
    SELECT 1
    FROM asignaciones a
    WHERE a.denuncia_id = d.id
      AND a.activo = true
)
ORDER BY d.fecha_hecho ASC;
