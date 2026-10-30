-- Xom Data · Each customer's cumulative spending
-- Problem: https://xomdata.com/practice/medium-runtotal-002
-- Solved: 2026-10-30

-- Write your SQL here
SELECT
customer_name
,month
,spend
,SUM(spend) OVER(
    PARTITION BY customer_name
    ORDER BY month
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS cumulative_spend
FROM wallet_monthly
ORDER BY customer_name, month
