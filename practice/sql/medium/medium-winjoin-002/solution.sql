-- Xom Data · The customer's total next to every order
-- Problem: https://xomdata.com/practice/medium-winjoin-002
-- Solved: 2026-10-30

-- Write your SQL here
select 
    customer_name,
    order_date,
    amount,
    sum(amount) over(partition by customer_name) as customer_total
from customers c
 join orders o on c.id = o.customer_id
order by customer_name, order_date
