-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-11-01

-- Write your SQL here
with cte as (
    select region,
        rep_name,
        sales_amount,
        ROW_NUMBER() over(partition by region order by sales_amount desc, rep_name) as rnk
    from reps

)
select region,
        rep_name,
        sales_amount
from cte
where rnk = 1
order by region
