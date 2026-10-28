-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-10-28

with cte as (
    select 
        supplier_name,
        material_type,
        count(po.id) as purchase_count,
        sum(po.total_value) as total_purchase_value,
        round(avg(cast(actual_receipt as date) - cast(expected_receipt as date)),2) as avg_late_days,
        ROUND(
            100.0 * COUNT(CASE WHEN CAST(po.actual_receipt AS DATE) <= CAST(po.expected_receipt AS DATE) THEN 1 END) 
            / COUNT(po.id), 
            2) as on_time_rate
    from suppliers s
    join purchase_orders po on s.id = po.supplier_id
    group by supplier_name, material_type
)
select *,
    rank() over(order by avg_late_days desc) as late_rank,
    ntile(4) over(order by avg_late_days desc, supplier_name) as risk_tier
from cte
where purchase_count >= 3 and avg_late_days > 0
order by late_rank, supplier_name
