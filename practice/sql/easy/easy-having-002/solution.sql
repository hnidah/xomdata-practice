-- Xom Data · Customers reaching the loyalty milestone
-- Problem: https://xomdata.com/practice/easy-having-002
-- Solved: 2026-09-09

-- Write your SQL here
select customer_name
, sum(amount) as total_spent
from purchases
group by customer_name
having sum(amount) >='5000000'
order by sum(amount) desc, customer_name;
