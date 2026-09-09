-- Xom Data · Categories full enough for the homepage
-- Problem: https://xomdata.com/practice/easy-having-001
-- Solved: 2026-09-09

-- Write your SQL here
SELECT category, count(product_name) as num_products 
from products
group by category
having count(product_name) >= '3'
order by category;
