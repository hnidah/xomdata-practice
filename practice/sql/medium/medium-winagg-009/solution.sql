-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (select distinct category,
    sum(amount) over (partition by category) as total_revenue
from sales
)
select *,
    round(total_revenue *100.0/(select sum(amount) from sales), 2) as pct_share
from cte
order by total_revenue desc, category
