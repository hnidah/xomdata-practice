-- Xom Data · Filter products by category
-- Problem: https://xomdata.com/practice/easy-where-001
-- Solved: 2026-09-09

SELECT name, price, categories
from products
where categories = 'Electronics'
ORDER BY name asc;
