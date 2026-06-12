SELECT
    d.codigo_seguimiento,
    d.fecha_hecho,
    td.nombre   AS tipo_delito,
    ed.nombre   AS estado,
    d.es_anonima
FROM denuncias d
INNER JOIN tipos_delito td    ON td.id = d.tipo_delito_id
INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
WHERE d.denunciante_id = 11
ORDER BY d.fecha_hecho DESC;