-- Xom Data · Labeling customers as retained or churned
-- Problem: https://xomdata.com/practice/medium-churn-001
-- Solved: 2026-10-28

SELECT
  customer_id,
  max(order_date) AS last_order_date,
  CASE
    WHEN cast('2024-06-30' AS date) - cast(max(order_date) AS date) > 90 THEN 'churned'
    ELSE 'active'
  END AS status
FROM
  orders
GROUP BY
  customer_id
