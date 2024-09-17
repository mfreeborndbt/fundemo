select shipmode, sum(revenue) as sm_rev
from {{ ref('fct_order_lineitems') }}
group by shipmode