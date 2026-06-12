SELECT
    r.tipo_resolucion,
    r.descripcion,
    r.fecha_resolucion,
    p.nombres || ' ' || p.apellidos AS nombre_fiscal,
    r.documento_url
FROM resoluciones r
INNER JOIN fiscales f  ON f.id = r.fiscal_id
INNER JOIN personas p  ON p.id = f.persona_id
WHERE r.denuncia_id = 1;