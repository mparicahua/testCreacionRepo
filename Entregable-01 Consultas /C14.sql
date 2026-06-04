SELECT 
    df.nombre AS nombre_del_distrito,
    df.sede,
    p.nombres || ' ' || p.apellidos AS nombre_del_fiscal,
    f.especialidad,
    f.codigo_fiscal
FROM distritos_fiscales df
JOIN ubigeo u ON df.ubigeo_id = u.id
LEFT JOIN fiscales f ON f.distrito_fiscal_id = df.id AND f.activo = TRUE
LEFT JOIN personas p ON f.persona_id = p.id
WHERE df.activo = TRUE
  AND (:filtrar_por_departamento = FALSE OR u.departamento ILIKE :departamento);