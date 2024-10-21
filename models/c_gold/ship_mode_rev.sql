select
    shipmode,
    sum(revenue) as rev
from {{ ref('fct_order_lineitems') }}
group by shipmode
