select shipmode, sum(revenue) as ship_rev
from {{ ref('agg_order_revenue') }}