-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-11-03

with cte as (
    select
        distinct warehouse_name,
        count(s.id) as import_count,
        count(distinct s.product_id) as distinct_product_count,
        count(distinct s.suppliers)  as distinct_supplier_count,
        max(import_date) as last_import_date
    from stock_imports s
    left join warehouses w on s.warehouse_id = w.id
    left join products p on p.id = s.product_id
    group by warehouse_name
)
select *,
    rank() over(order by import_count desc) as activity_rank,
    lag(warehouse_name) over(order by import_count desc, warehouse_name) as prev_warehouse
from cte
order by activity_rank, warehouse_name
