SELECT 
    u.departamento,
    u.provincia,
    u.distrito,
    
    
    COUNT(d.id_denuncia) AS total_denuncias

FROM Denuncias d
INNER JOIN ubigeo u ON d.id_ubigeo = u.id

WHERE 
    d.fecha_registro BETWEEN :fecha_inicio AND :fecha_fin


GROUP BY u.id, u.departamento, u.provincia, u.distrito
HAVING COUNT(d.id_denuncia) > :N_denuncias


ORDER BY total_denuncias DESC;