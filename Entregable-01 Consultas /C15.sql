SELECT
    d.codigo_seguimiento,
    d.fecha_hecho,
    td.nombre          AS tipo_delito,
    der.fecha_derivacion,
    der.estado         AS estado_derivacion
FROM derivaciones der
INNER JOIN denuncias d        ON d.id = der.denuncia_id
INNER JOIN tipos_delito td    ON td.id = d.tipo_delito_id
INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
WHERE der.fiscal_id = 1
  AND ed.nombre = 'EN_INVESTIGACION'
ORDER BY der.fecha_derivacion DESC;