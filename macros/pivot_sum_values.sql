{% macro calculate_sum_ship_mode(ship_methods, table) %}

    {% for ship_method in ship_methods %}
        sum(case when shipmode = '{{ ship_method }}' then total_revenue end) as {{ ship_method | replace(' ', '') }}_REVENUE
        {% if not loop.last %} , {% endif %}
    {% endfor %}
from {{ table }}

{% endmacro %}
