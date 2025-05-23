with revenue_by_shipmode_and_shipdate as (
    select
        year(ship_date) as ship_year,
        ship_mode,
        sum(revenue) as total_revenue
    from
        {{ ref('fct_order_customer') }}
    group by
        1, 2
)

select
    ship_year,
    ship_mode,
    total_revenue
from
    revenue_by_shipmode_and_shipdate
order by
    ship_year,
    ship_mode