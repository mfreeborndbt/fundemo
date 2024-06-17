{% test not_negative (model,column_name) %}

select count(*)
from {{ model }}
where {{ column_name }} < 0

{% endtest %}