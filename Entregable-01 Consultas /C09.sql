SELECT 
    A.fecha_hora AS "Fecha",
    A.tipo AS "Tipo",
    A.lugar AS "Lugar",
    A.estado AS "Estado",
    P.nombres ||' '|| P.apellidos AS "Nombre del fiscal",
    A.acta AS "Acta resumida"

    FROM "audiencias" A
    LEFT JOIN "fiscales" F ON A.fiscal_id = F.id
    LEFT JOIN "personas" P ON F.persona_id = P.id

    WHERE A.denuncia_id = :id_denuncia

    ORDER BY A.fecha_hora ASC; 