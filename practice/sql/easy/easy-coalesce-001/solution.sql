-- Xom Data · Display names on profile pages
-- Problem: https://xomdata.com/practice/easy-coalesce-001
-- Solved: 2026-09-09

-- Write your SQL here
SELECT
  real_name,
  nickname,
  CASE
    WHEN nickname IS NOT NULL THEN nickname
    WHEN nickname IS NULL THEN real_name
  END AS display_name
  from profiles;
