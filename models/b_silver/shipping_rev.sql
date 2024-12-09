SELECT 
    SUM(revenue) AS total_revenue,
    shipmode,
    YEAR(shipdate) AS ship_year
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode,
    YEAR(shipdate)
ORDER BY 
    total_revenue DESC