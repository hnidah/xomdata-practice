-- Xom Data · Countdown before losing a customer
-- Problem: https://xomdata.com/practice/medium-churn-003
-- Solved: 2026-11-05

select
    distinct customer_id,
    (cast('2024-06-30' as date) - cast(max(order_date) as date)) as days_silent,
    (90 - ('2024-06-30' - cast(max(order_date) as date))) as days_left
from orders
group by customer_id
having  (90 - ('2024-06-30' - cast(max(order_date) as date))) >= 0
order by days_left, customer_id
