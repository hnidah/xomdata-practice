-- Xom Data · Opening order or returning order
-- Problem: https://xomdata.com/practice/medium-cohort-002
-- Solved: 2026-10-31

-- Write your SQL here
with cte as (
    select customer_name,
        order_date,
        amount,
        rank() over(partition by customer_name order by order_date) as rnk
    from orders
)
select customer_name,
    order_date,
    amount,
    case when rnk = 1 then 'New'
        else 'Returning'
        end as order_type
from cte
order by customer_name, order_date
