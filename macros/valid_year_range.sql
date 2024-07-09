{% test valid_year_range(model, column_name, start_year, end_year) %}

with invalid_dates as (
    select *
    from {{ model }}
    where {{ column_name }} < {{ start_year }}
      or {{ column_name }} > {{ end_year }}
)

select *
from invalid_dates

{% endtest %}