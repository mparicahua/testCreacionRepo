-- Denunciantes
SELECT 
    'Denunciante' AS "Tipo de implicado", 
    P.numero_documento AS "Documento", 
    P.nombres ||' '|| P.apellidos AS "Nombre"
FROM "denuncias" D 
INNER JOIN "personas" P ON D.denunciante_id = P.id
WHERE D.id = :id_denuncia

UNION ALL

SELECT 
    'Denunciado', 
    DN.dni, 
    DN.nombres ||' '|| DN.apellidos
FROM "denunciados" DN
WHERE DN.denuncia_id = :id_denuncia

UNION ALL

SELECT 
    'Testigo', 
    T.dni, 
    T.nombres ||' '|| T.apellidos
FROM "testigos" T
WHERE T.denuncia_id= :id_denuncia;