select
    custkey,
    round(sum(revenue)) as customer_spend,
    case
        when round(sum(revenue)) <= 300000 then 'Tier 1'
        when round(sum(revenue)) <= 1000000 then 'Tier 2'
        when round(sum(revenue)) <= 2000000 then 'Tier 3'
        when round(sum(revenue)) <= 4000000 then 'Tier 4'
        else 'Tier 5'
    end as customer_tier
from {{ ref('fct_order_customer') }}
group by custkey
order by customer_spend asc