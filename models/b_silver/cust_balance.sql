select customer_name, sum(acctbal) as customer_balance
from {{ ref('dim_customer') }}
group by customer_name