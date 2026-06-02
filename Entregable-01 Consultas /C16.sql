SELECT 
    D.categoria AS "Gravedad",
    COUNT(D.id_delito) AS "Cantidad de delitos"

FROM Denuncia_Delito DD
INNER JOIN Delitos D ON DD.id_delito = D.id_delito

WHERE DD.id_denuncia = :id_denuncia

GROUP BY D.categoria
HAVING COUNT(D.id_delito) >=1;