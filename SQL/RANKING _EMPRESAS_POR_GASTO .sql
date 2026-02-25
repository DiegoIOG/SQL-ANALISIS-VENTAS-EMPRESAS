SELECT   
e.nombre_empresa,
c.cliente_id,
c.nombre,
c.apellido,
SUM(v.total) AS total_gastado,
RANK() OVER (ORDER BY SUM(v.total)DESC) AS ranking
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id
JOIN empresa e ON c.empresa_id = e.empresa_id
GROUP BY e.nombre_empresa,c.cliente_id,c.nombre,c.apellido;