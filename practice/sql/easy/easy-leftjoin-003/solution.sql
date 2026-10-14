-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-10-14

-- Write your SQL here
SELECT
  branch_name,
  coalesce(count(b.id), 0) AS num_bookings
FROM
  branches br
  LEFT JOIN bookings b ON br.id = b.branch_id
GROUP BY branch_name
order by branch_name;
