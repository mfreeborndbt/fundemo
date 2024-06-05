with source as (

    select
        N_NATIONKEY as nationkey,
        N_NAME as name,
        N_REGIONKEY as regionkey,
        N_COMMENT as comment

    from {{ source('snowflake_sample_data', 'nation') }}

)

select * from source
