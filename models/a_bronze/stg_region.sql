with
    source as (

        select r_regionkey as regionkey, r_name as name, r_comment as comment

        from {{ source("snowflake_sample_data", "region") }}

    )

select *
from source
