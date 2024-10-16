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
            sum(revenue)*1.2 as total_revenue
        from revenue_data
        group by year, returnflag, shipmode, region_name, nation_name

    )

select *
from aggregated_revenue