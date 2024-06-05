with
    source as (

        select
            n_nationkey as nationkey,
            n_name as name,
            n_regionkey as regionkey,
            n_comment as comment

        from {{ source("snowflake_sample_data", "nation") }}

    )

select *
from source
