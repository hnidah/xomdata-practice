-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-11-06

with cte as (
    select 
        left(transaction_date, 7) as month,
        count(id) as transaction_count,
        sum(amount) as total_amount
    from transactions
    group by month
)
select 
    month,
    transaction_count,
    total_amount,
    coalesce(total_amount - lag(total_amount) over(order by month), NULL) as mom_delta
from cte
order by month
