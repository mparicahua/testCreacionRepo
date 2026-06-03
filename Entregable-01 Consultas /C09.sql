SELECT 
    audiencias.fecha_hora AS fecha,
    audiencias.tipo,
    audiencias.lugar,
    audiencias.estado,
    personas.nombres,
    personas.apellidos,
    audiencias.acta AS acta_resumida
FROM 
    audiencias
LEFT JOIN 
    fiscales ON audiencias.fiscal_id = fiscales.id
LEFT JOIN 
    personas ON fiscales.persona_id = personas.id
WHERE 
    audiencias.denuncia_id = 2;