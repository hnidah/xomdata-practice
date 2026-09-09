-- Xom Data · Customers in key cities
-- Problem: https://xomdata.com/practice/easy-in-001
-- Solved: 2026-09-09

-- Write your SQL here
select customer_name, city
from customers
where city In ('Fairview', 'Denver', 'Springfield');
