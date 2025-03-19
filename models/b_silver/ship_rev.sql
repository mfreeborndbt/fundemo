with order_data as (
    select
        ship_mode,
        date_part(year, ship_date) as ship_year,
        sum(revenue) as total_revenue
    from
        {{ ref('fct_order_customer') }}
    group by
        1, 2
)

select
    ship_mode,
    ship_year,
    total_revenue
from
    order_data
```
