{% test unique_nation_region(model, column_name=None) %}

with nation_region_counts as (
    select
        nation_name,
        count(distinct region_name) as region_count
    from {{ model }}
    group by nation_name
)

select nation_name
from nation_region_counts
where region_count > 1

{% endtest %}