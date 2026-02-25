WITH ventas_mensuales AS (
    SELECT 
        cliente_id,
        YEAR(fecha) AS anio,
        MONTH(fecha) AS mes,
        SUM(total) AS total_mes
    FROM ventas
    GROUP BY cliente_id, YEAR(fecha), MONTH(fecha)
)

SELECT *
FROM (
    SELECT *,
           LAG(total_mes) OVER (
                PARTITION BY cliente_id
                ORDER BY anio, mes
           ) AS mes_anterior
    FROM ventas_mensuales
) t
WHERE mes_anterior IS NOT NULL
  AND total_mes < mes_anterior * 0.5;
  