SELECT 
    c.cliente_id,
    c.nombre,
    COUNT(DISTINCT MONTH(v.fecha)) AS meses_activos
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id
WHERE v.fecha >= '2024-01-01'
  AND v.fecha <  '2025-01-01'
GROUP BY c.cliente_id, c.nombre
ORDER BY meses_activos DESC 
