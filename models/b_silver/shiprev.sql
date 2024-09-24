select shipmode, sum(revenue) as shiprev
from {{ ref('fct_order_lineitems') }}