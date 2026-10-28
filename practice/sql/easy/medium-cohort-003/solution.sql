-- Xom Data · Each customer's debut month
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-10-28

select customer_id,
    left(min(order_date),7) as cohort_month
from orders
group by customer_id
order by cohort_month, customer_id
