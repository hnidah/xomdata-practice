-- Xom Data · Who showed up in two consecutive months
-- Problem: https://xomdata.com/practice/medium-active-002
-- Solved: 2026-11-05

SELECT customer_id
FROM orders
WHERE order_date >= '2024-03-01' AND order_date <= '2024-04-30'
GROUP BY customer_id
HAVING COUNT(DISTINCT SUBSTRING(order_date, 1, 7)) = 2;
