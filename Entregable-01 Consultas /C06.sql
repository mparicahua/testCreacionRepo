SELECT 
    ea.nombre AS estado_anterior,
    en.nombre AS estado_nuevo,
    he.motivo,
    p.nombres || ' ' || p.apellidos AS quien_hizo_el_cambio,
    he.created_at AS fecha
FROM historial_estados he
LEFT JOIN estados_denuncia ea ON he.estado_anterior_id = ea.id
JOIN estados_denuncia en ON he.estado_nuevo_id = en.id
JOIN usuarios u ON he.usuario_id = u.id
JOIN personas p ON u.id = p.usuario_id
WHERE he.denuncia_id = :denuncia_id
ORDER BY he.created_at DESC;