SELECT 
    shipmode, 
    YEAR(shipdate) AS ship_year, 
    SUM(revenue) AS total_revenue
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode, 
    YEAR(shipdate)