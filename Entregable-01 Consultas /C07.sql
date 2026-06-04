SELECT 
    d.codigo_seguimiento AS codigo,
    d.created_at AS fecha,
    td.nombre AS tipo_delito,
    ed.nombre AS estado,
    df.nombre AS distrito_fiscal
FROM denuncias d
JOIN tipos_delito td ON d.tipo_delito_id = td.id
JOIN estados_denuncia ed ON d.estado_id = ed.id
JOIN distritos_fiscales df ON d.distrito_fiscal_id = df.id
WHERE d.created_at BETWEEN :fecha_inicio AND :fecha_fin
  AND (:filtrar_por_estado = FALSE OR d.estado_id = :estado_id);