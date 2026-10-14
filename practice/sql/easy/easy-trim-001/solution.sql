-- Xom Data · Cleaning whitespace in the lead list
-- Problem: https://xomdata.com/practice/easy-trim-001
-- Solved: 2026-10-14

-- Write your SQL here
SELECT
  full_name,
  trim(full_name) AS clean_name,
  phone
FROM leads
