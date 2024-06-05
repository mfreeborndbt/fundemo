with source as (

    select
        R_REGIONKEY as regionkey,
        R_NAME as name,
        R_COMMENT as comment

    from {{ source('snowflake_sample_data', 'region') }}

)

select * from source
