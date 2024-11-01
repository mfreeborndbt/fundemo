select
    shipmode,
    sum(revenue) as shipping_rev
from {{ ref('fct_order_lineitems') }}
group by shipmode
