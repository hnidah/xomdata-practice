-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (select 
    distinct customer_name,
    sum(amount) over(partition by customer_name) as total_spent
from purchases
) 
select *,
    dense_rank() over (order by total_spent desc) as spend_tier
from cte
order by spend_tier, customer_name
