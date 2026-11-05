-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-11-05

with cte as (
    select 
        user_id,
        max(order_date) as last_order_date
    from orders
    group by user_id
),
max_date as (
    select max(order_date) as max_ords
    from orders 
)
select 
    user_id,
    last_order_date,
    cast(max_ords as date) - cast(last_order_date as date) as days_since_last
from cte 
cross join max_date 
where cast(max_ords as date) - cast(last_order_date as date) >= 90
order by days_since_last desc, user_id
