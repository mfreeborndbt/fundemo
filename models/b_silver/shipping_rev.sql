
SELECT
    shipmode,
ROUND(SUM(revenue)) AS total_revenue
FROM
    {{ ref('fct_order_lineitems') }}
GROUP BY
    shipmode