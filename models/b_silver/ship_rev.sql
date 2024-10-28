select
    shipmode,
    sum(revenue) as ship_rev
from {{ ref('fct_order_lineitems') }}
group by shipmode
