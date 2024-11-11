SELECT 
    shipmode, 
    SUM(revenue) AS total_revenue
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode