-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-10-14

-- Write your SQL here
SELECT
  member_name,
  coalesce(sum(amount), 0) AS total_spent
FROM
  members m
  LEFT JOIN bills b ON m.id = b.member_id
GROUP BY
  member_name
ORDER BY
  member_name;
