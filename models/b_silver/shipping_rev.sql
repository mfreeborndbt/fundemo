SELECT 
    shipmode, 
    DATE_TRUNC('year', shipdate) AS ship_year,
    ROUND(SUM(revenue)) AS total_revenue
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode,
    DATE_TRUNC('year', shipdate)