select shipmode, sum(revenue) as ship_mode_rev
from {{ ref('fct_order_customer') }}
group by shipmode