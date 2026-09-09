-- Xom Data · Basic-plan subscribers
-- Problem: https://xomdata.com/practice/easy-like-001
-- Solved: 2026-09-09

select phone_number, full_name, plans
from subscribers
where lower(plans) like '%basic%'
ORDER BY full_name asc;
