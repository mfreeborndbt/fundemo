{{
    config(
        materialized='table'
    )
}}

with
    source as (

        select
            c_custkey as custkey,
            c_name as name,
            c_address as address,
            c_nationkey as nationkey,
            c_phone as phone,
            c_acctbal as acctbal,
            c_mktsegment as mktsegment,
            c_comment as comment

        from {{ source("snowflake_sample_data", "customer") }}

    )

select *
from source
