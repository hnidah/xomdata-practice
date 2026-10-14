-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-10-14

WITH
  cus_tb AS (
    SELECT
      c.full_name,
      count(customer_id) AS order_count,
      sum(total_amount) AS total_spending,
      avg(total_amount) AS avg_order_value
    FROM
      customers c
      JOIN orders o ON c.id = o.customer_id
    GROUP BY c.id, c.full_name
  )
SELECT
  full_name,
  order_count,
  total_spending,
  avg_order_value,
  ROW_NUMBER() OVER(
        ORDER BY total_spending desc, full_name asc
    ) AS spending_rank
FROM
  cus_tb
ORDER BY spending_rank asc;
