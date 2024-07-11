select *
from {{ ref('fct_order_lineitems') }}
limit 5