with
    orders as (

        select
            orderkey,
            custkey,
            orderstatus,
            totalprice,
            orderdate,
            orderpriority,
            clerk,
            shippriority
        from {{ ref("stg_orders") }}

    ),

    lineitem as (

        select
            orderkey,
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
            shipmode
        from {{ ref("stg_lineitem") }}

    )

select
    o.orderkey,
    o.custkey,
    o.orderstatus,
    o.totalprice,
    o.orderdate,
    o.orderpriority,
    o.clerk,
    o.shippriority,
    l.partkey,
    l.suppkey,
    l.linenumber,
    l.quantity,
    l.extendedprice,
    l.discount,
    l.tax,
    l.returnflag,
    l.linestatus,
    l.shipdate,
    l.commitdate,
    l.receiptdate,
    l.shipinstruct,
    l.shipmode
from orders o
left join lineitem l on o.orderkey = l.orderkey
