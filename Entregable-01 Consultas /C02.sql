SELECT
    d.codigo_seguimiento,
    d.fecha_hecho,
    td.nombre          AS tipo_delito,
    ed.nombre          AS estado,
    CASE
        WHEN d.es_anonima = true THEN 'ANÓNIMO'
        ELSE p.nombres || ' ' || p.apellidos
    END                AS nombre_denunciante
FROM asignaciones a
INNER JOIN denuncias d       ON d.id = a.denuncia_id
INNER JOIN tipos_delito td   ON td.id = d.tipo_delito_id
INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
INNER JOIN personas p        ON p.id = d.denunciante_id
WHERE a.funcionario_id = 1 
  AND a.activo = true
ORDER BY d.fecha_hecho DESC;