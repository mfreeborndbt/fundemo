
SELECT
    revenue,
    SUM(ship_mode) AS total_ship_mode
FROM
    {{ ref('fct_order_lineitems') }}
GROUP BY
    revenue