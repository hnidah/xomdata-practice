-- Xom Data · Accounts that must be renamed
-- Problem: https://xomdata.com/practice/easy-length-001
-- Solved: 2026-10-14

-- Write your SQL here
WITH
  len_tb AS (
    SELECT
      p.username, p.level,
      length(p.username) AS len
    FROM
      players p
    WHERE length(p.username) < 6
    group by p.username, p.level
  )
SELECT
  username,
  level
FROM
  len_tb;
