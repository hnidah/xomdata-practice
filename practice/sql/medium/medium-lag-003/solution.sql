-- Xom Data · Last month per branch
-- Problem: https://xomdata.com/practice/medium-lag-003
-- Solved: 2026-10-30

-- Write your SQL here
SELECT
  branch,
  MONTH,
  revenue,
  lag(revenue) OVER (PARTITION BY branch order by month) AS prev_revenue
from branch_revenue
order by branch, month
