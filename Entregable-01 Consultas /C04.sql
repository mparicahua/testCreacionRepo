SELECT 
    CASE 
        WHEN t.persona_id IS NULL THEN t.nombre_anonimo
        ELSE p.nombres || ' ' || p.apellidos 
    END AS nombre,
    t.declaracion,
    CASE 
        WHEN t.persona_id IS NULL THEN TRUE 
        ELSE FALSE 
    END AS si_es_anonimo
FROM testigos t
LEFT JOIN personas p ON t.persona_id = p.id
WHERE t.denuncia_id = :denuncia_id;