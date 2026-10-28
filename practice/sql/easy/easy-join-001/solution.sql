-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-10-28

-- Write your SQL here
select order_code,
    customer_name,
    amount
from customers c
join orders o on c.id = o.customer_id
