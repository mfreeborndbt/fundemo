with
    order_lineitems as (

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
            revenue,
            quantity,
            extendedprice,
            discount,
            tax as t,
            returnflag,
            linestatus,
            shipdate,
            commitdate,
            receiptdate,
            shipinstruct,
            shipmode
        from {{ ref("fct_order_lineitems") }}

    ),

    customer_details as (

        select
            custkey,
            customer_name,
            address,
            phone,
            acctbal,
            mktsegment,
            nation_name,
            region_name
        from {{ ref("dim_customer") }}

    )

select
    ol.orderkey,
    ol.custkey,
    ol.orderstatus,
    ol.totalprice,
    ol.orderdate,
    ol.orderpriority,
    ol.clerk,
    ol.shippriority,
    ol.partkey,
    ol.suppkey,
    ol.linenumber,
    ol.quantity,
    ol.extendedprice,
    ol.revenue,
    ol.discount,
    ol.tax,
    ol.returnflag,
    ol.linestatus,
    ol.shipdate,
    ol.commitdate,
    ol.receiptdate,
    ol.shipinstruct,
    ol.shipmode,
    cd.customer_name,
    cd.address,
    cd.phone,
    cd.acctbal,
    cd.mktsegment,
    cd.nation_name,
    cd.region_name
from order_lineitems ol
left join customer_details cd on ol.custkey = cd.custkey
