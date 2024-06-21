{% test non_negative(model, column_name) %}

with failures as (
    select *
    from {{ model }}
    where {{ column_name }} < 0
)

select *
from failures

{% endtest %}