with order_data as (
    select
        ship_mode,
        ship_date,
        sum(revenue) as total_revenue
    from
        {{ ref('fct_order_customer') }}
    group by
        1, 2
)

select
    ship_mode,
    ship_date,
    total_revenue
from
    order_data