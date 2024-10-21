{{ config(materialized="table") }}

with
    fact_data as (
        select
            orderkey,
            custkey,
            orderstatus,
            totalprice,
            orderdate,
            orderpriority,
            clerk,
            shippriority,
            partkey,
            suppkey,
            linenumber,
            quantity,
            extendedprice,
            discount,
            tax as taxes,
            returnflag,
            linestatus,
            shipdate,
            commitdate,
            receiptdate,
            shipinstruct,
            shipmode,
            customer_name,
            address,
            phone,
            acctbal,
            mktsegment,
            nation_name,
            region_name,
            revenue
        from {{ ref("fct_order_customer") }}
    ),

    revenue_data as (
        select
            date_part('year', orderdate) as year,
            returnflag,
            shipmode,
            region_name,
            nation_name,
            revenue
        from fact_data
    ),

    aggregated_revenue as (
        select
            year,
            returnflag,
            shipmode,
            region_name,
            nation_name,
            sum(revenue) as total_revenue
        from revenue_data
        group by year, returnflag, shipmode, region_name, nation_name
    ),

    final_data as (
        select
            *,
            {{ dbt_assertions.assertions(column='exceptions') }} -- Apply the assertion to the 'exceptions' column
        from aggregated_revenue
    )

-- Filter out rows that fail the 'YEAR < 1998' check based on 'exceptions'
select *
from final_data
where {{ dbt_assertions.assertions_filter(column='exceptions') }}
order by year desc