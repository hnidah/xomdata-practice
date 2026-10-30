-- Xom Data · Revenue rank of each category
-- Problem: https://xomdata.com/practice/medium-rank-003
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (
    select 
        distinct category,
        sum(amount) over(partition by category) as total_revenue
    from sales
)
select *,
    rank() over( order by total_revenue desc) as revenue_rank
from cte
order by revenue_rank, category
