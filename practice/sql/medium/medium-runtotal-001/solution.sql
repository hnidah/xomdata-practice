-- Xom Data · Class fund running total by day
-- Problem: https://xomdata.com/practice/medium-runtotal-001
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (select collect_date,
    amount,
    sum(amount) over(partition by collect_date) as sum_amount
from fund_log)
select 
    collect_date,
    amount,
    sum(sum_amount) over(order by collect_date) as running_total
from cte
order by collect_date
