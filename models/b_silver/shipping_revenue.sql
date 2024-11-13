SELECT 
    shipmode, 
    SUM(revenue) AS total_revenue
FROM 
    {{ ref('fct_order_customer') }}
GROUP BY 
    shipmode
ORDER BY 
    ROUND(total_revenue) DESC