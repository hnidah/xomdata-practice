-- Xom Data · Trend labels for the monthly report
-- Problem: https://xomdata.com/practice/medium-lag-004
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (
    select 
        month,
        revenue,
        lag(revenue) over (order by month) as pre_month
    from monthly_revenue
)
select 
    month,
    revenue,
    case when (revenue - pre_month) > 0 then 'Up'
    when (revenue - pre_month) < 0 then 'Down'
    when (revenue - pre_month) = 0 then 'Flat'
    else 'First'
    end as trend
from cte
order by month
