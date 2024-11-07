
select shipmode, round(sum(revenue)) as shipping_rev
from {{ ref('fct_order_customer') }}
group by shipmode
order by shipping_rev desc