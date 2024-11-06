with
    customer as (

        select
            custkey,
            name as customer_name,
            address,
            nationkey,
            phone,
            acctbal,
            mktsegment
        from {{ ref("stg_customer") }}

    ),

    nation as (

        select nationkey, name as nation_name, regionkey from {{ ref("stg_nation") }}

    ),

    region as (select regionkey, name as region_name from {{ ref("stg_region") }})

select
    c.custkey,
    c.customer_name,
    c.address,
    c.phone,
    c.acctbal,
    c.acctbal*1.1 acctbal_euro,
    c.mktsegment,
    n.nation_name,
    r.region_name
from customer c
left join nation n on c.nationkey = n.nationkey
left join region r on n.regionkey = r.regionkey
