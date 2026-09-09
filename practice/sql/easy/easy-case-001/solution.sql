-- Xom Data · Safety training results
-- Problem: https://xomdata.com/practice/easy-case-001
-- Solved: 2026-09-09

-- Write your SQL here
SELECT
  trainee_name,
  score,
  CASE
    WHEN score >= '70' THEN 'Pass'
    ELSE 'Fail'
  END AS result
FROM
  trainees;
