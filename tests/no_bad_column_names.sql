-- Returns rows (fails) if any banned names are found.
select
  name
from {{ ref('stg_columns') }}
where lower(name) in ('value','data','misc')
