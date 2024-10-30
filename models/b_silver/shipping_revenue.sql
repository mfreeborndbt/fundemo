select
    shipmode,
    sum(revenue) as shipping_revenue
from {{ ref('fct_order_lineitems') }}
group by shipmode
