-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-10-31

-- Write your SQL here
select 
    customer_name,
    order_date, 
    left(min(order_date) over(partition by customer_name), 7) as cohort_month
from orders
order by customer_name, order_date
