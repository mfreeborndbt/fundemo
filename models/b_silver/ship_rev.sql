with revenue_by_ship as (
    select
        date_part('year', shipdate) as year,
        shipmode,
        sum(revenue) as total_revenue
    from {{ ref('fct_order_lineitems') }}
    group by 1, 2
)

select *
from revenue_by_ship
order by year desc, shipmode