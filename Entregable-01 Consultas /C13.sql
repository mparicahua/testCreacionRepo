SELECT
    td.nombre AS tipo_delito,
    td.articulo_cp,
    td.gravedad,
    td.descripcion
FROM tipos_delito td
INNER JOIN categorias_delito cd ON cd.id = td.categoria_id
WHERE td.categoria_id = 3
  AND td.activo = true
ORDER BY td.gravedad, td.nombre;
