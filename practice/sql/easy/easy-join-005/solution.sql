-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-10-28

-- Write your SQL here
select ticket_code, status_name
from statuses sta
join tickets ti on sta.code = ti.status_code
