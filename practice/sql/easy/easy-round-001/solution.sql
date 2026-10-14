-- Xom Data · Display rates for the app
-- Problem: https://xomdata.com/practice/easy-round-001
-- Solved: 2026-10-14

-- Write your SQL here
SELECT
  currency_pair,
  round(raw_rate, 2) AS display_rate
FROM
  fx_rates;
