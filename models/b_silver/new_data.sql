select shipmode, sum(revenue)
from {{ ref('fct_order_lineitems') }}
group by shipmode