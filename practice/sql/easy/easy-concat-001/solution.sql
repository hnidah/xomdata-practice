-- Xom Data · Names printed on staff badges
-- Problem: https://xomdata.com/practice/easy-concat-001
-- Solved: 2026-09-09

-- Write your SQL here
select first_name, last_name, CONCAT(first_name, ' ', last_name) as badge_name
from staff;
