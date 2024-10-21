select shipmode, sum(revenue) as revenue
from {{ ref('fct_order_lineitems') }}
group by shipmode