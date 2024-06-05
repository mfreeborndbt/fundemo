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
            tax,
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
            (extendedprice * quantity) as revenue
        from {{ ref("fact_order_customer") }}

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

    )

select *
from aggregated_revenue
