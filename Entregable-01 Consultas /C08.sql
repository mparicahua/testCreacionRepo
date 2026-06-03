SELECT 
    (p.nombres || ' ' || p.apellidos) AS nombre_del_fiscal,
    f.especialidad,
    df.nombre AS distrito_fiscal,
    d.fecha_derivacion,
    d.estado,
    d.motivo
FROM derivaciones d
INNER JOIN fiscales f ON d.fiscal_id = f.id
INNER JOIN personas p ON f.persona_id = p.id
INNER JOIN distritos_fiscales df ON f.distrito_fiscal_id = df.id
WHERE d.denuncia_id = 3;