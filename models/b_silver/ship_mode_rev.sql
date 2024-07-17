select shipmode, sum(revenue)
from {{ ref('fct_order_customer') }}
group by shipmode