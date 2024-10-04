select shipmode, sum(revenue) as ship_rev
from {{ ref('fct_order_customer') }}
group by shipmode