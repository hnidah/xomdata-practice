-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-10-28

-- Write your SQL here
select distinct customer_name
from customers cus
join purchases pur on cus.id = pur.customer_id
where category = 'Skincare'
