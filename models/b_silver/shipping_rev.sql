SELECT 
    shipmode, 
    YEAR(shipdate) AS ship_year,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode, 
    YEAR(shipdate)
ORDER BY 
    total_revenue DESC