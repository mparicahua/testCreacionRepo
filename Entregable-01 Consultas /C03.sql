SELECT
    d.codigo_seguimiento,
    d.descripcion_hecho,
    d.fecha_hecho,
    td.nombre AS tipo_delito,
    cd.nombre AS categoria_delito,
    ed.nombre AS estado_actual,
    p.nombres || ' ' || p.apellidos AS nombre_denunciante,
    df.nombre AS distrito_fiscal
FROM denuncias d
    INNER JOIN tipos_delito td ON td.id = d.tipo_delito_id
    INNER JOIN categorias_delito cd ON cd.id = td.categoria_id
    INNER JOIN estados_denuncia ed ON ed.id = d.estado_id
    INNER JOIN personas p ON p.id = d.denunciante_id
    LEFT JOIN distritos_fiscales df ON df.id = d.distrito_fiscal_id
WHERE d.codigo_seguimiento = codigo_seguimiento;
