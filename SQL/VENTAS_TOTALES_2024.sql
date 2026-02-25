  --Calcula las ventas 2024 

select e.nombre_empresa,
 SUM(v.total) AS total_ventas_2024
 FROM ventas v
 JOIN clientes c ON v.cliente_id = c.cliente_id
 JOIN empresa e ON c.empresa_id = e.empresa_id
 WHERE v.fecha >= '2024-01-01'
  AND v.fecha <  '2025-01-01'
  GROUP BY e.nombre_empresa
  ORDER BY total_ventas_2024 DESC;

 
