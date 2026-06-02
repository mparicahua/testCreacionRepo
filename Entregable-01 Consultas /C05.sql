SELECT 
    E.nombre_archivo, 
    TE.nombre AS "Tipo de evidencia",
    E.tamanio_bytes AS "Tamaño",
    E.created_at AS "Fecha de subida",
    P.nombres ||' '|| P.apellidos AS "Subida por",
    E.url_almacenamiento AS "URL"

    FROM "evidencias" E
    INNER JOIN "tipos_evidencia" TE ON E.tipo_id = TE.id
    LEFT JOIN "usuarios" U ON E.subido_por = U.id
    LEFT JOIN "personas" P ON U.id = P.usuario_id

    WHERE E.denuncia_id = :id_denuncia 

    ORDER BY E.created_at DESC;