with order_data as (
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
    order_data
order by
    ship_year,
    ship_mode