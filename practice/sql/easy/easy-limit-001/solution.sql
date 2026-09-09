-- Xom Data · 5 cheapest products
-- Problem: https://xomdata.com/practice/easy-limit-001
-- Solved: 2026-09-09

SELECT NAME, price
FROM products
order by price
limit 5;
