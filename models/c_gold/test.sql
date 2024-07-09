select
sum( case when shipmode = 'TRUCK' then total_revenue END) as TRUCK_REVENUE,
sum( case when shipmode = 'MAIL' then total_revenue END) as MAIL_REVENUE,
sum( case when shipmode = 'REG AIR' then total_revenue END) as REGAIR_REVENUE,
sum( case when shipmode = 'AIR' then total_revenue END) as AIR_REVENUE,
sum( case when shipmode = 'FOB' then total_revenue END) as FOB_REVENUE,
sum( case when shipmode = 'SHIP' then total_revenue END) as SHIP_REVENUE,
sum( case when shipmode = 'RAIL' then total_revenue END) as RAIL_REVENUE
from {{ ref('agg_order_revenue') }}