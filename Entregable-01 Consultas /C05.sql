SELECT 
    E.nombre_archivo, 
    TE.nombre AS "Tipo de evidencia",
    E.tamanio_bytes AS "Tamaño",
    E.created_at AS "Fecha de subida",
    U.email AS "Subido por",
    E.url_almacenamiento AS "URL"

FROM evidencias e
INNER JOIN tipos_evidencia TE ON E.tipo_id = TE.id
LEFT JOIN usuarios U ON E.subido_por = U.id 
WHERE E.denuncia_id = 2;