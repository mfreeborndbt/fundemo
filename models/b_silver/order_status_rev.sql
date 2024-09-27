select
    orderstatus,
    sum(revenue) as os_rev
from {{ ref('fct_order_customer') }}
group by orderstatus