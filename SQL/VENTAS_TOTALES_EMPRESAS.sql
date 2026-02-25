SELECT  c.cliente_id,
 c. nombre,
 c.apellido,
 e.nombre_empresa,
 SUM (v.total) AS total_gastado
 FROM ventas v
 JOIN clientes c ON  v.cliente_id= c.cliente_id
 join empresa e ON  c.empresa_id= e.empresa_id
 GROUP BY c.cliente_id,c.nombre,c.apellido,e.nombre_empresa;