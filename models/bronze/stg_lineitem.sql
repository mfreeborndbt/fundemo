with source as (

    select
        L_ORDERKEY as orderkey,
        L_PARTKEY as partkey,
        L_SUPPKEY as suppkey,
        L_LINENUMBER as linenumber,
        L_QUANTITY as quantity,
        L_EXTENDEDPRICE as extendedprice,
        L_DISCOUNT as discount,
        L_TAX as tax,
        L_RETURNFLAG as returnflag,
        L_LINESTATUS as linestatus,
        L_SHIPDATE as shipdate,
        L_COMMITDATE as commitdate,
        L_RECEIPTDATE as receiptdate,
        L_SHIPINSTRUCT as shipinstruct,
        L_SHIPMODE as shipmode,
        L_COMMENT as comment

    from {{ source('snowflake_sample_data', 'lineitem') }}

)

select * from source
