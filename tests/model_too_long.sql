-- Fails if any model has >= 500 lines of SQL
select *
from {{ ref('int_all_graph_resources') }}
where number_lines >= 500
