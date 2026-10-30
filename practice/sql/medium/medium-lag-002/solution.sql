-- Xom Data · Change versus last month
-- Problem: https://xomdata.com/practice/medium-lag-002
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (
    select 
        month,
        revenue,
        lag(revenue) over(order by month) as pre_rev
    from monthly_revenue
)
select month,
    revenue,
    (revenue - pre_rev) as mom_change
from cte
order by month
