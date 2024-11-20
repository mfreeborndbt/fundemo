SELECT 
    shipmode, 
    YEAR(shipdate) AS ship_year, 
    SUM(revenue) AS total_revenue
FROM 
    {{ ref('fct_order_lineitems') }}
GROUP BY 
    shipmode, 
    YEAR(shipdate)