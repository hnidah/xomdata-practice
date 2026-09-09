-- Xom Data · Dishes off this season's menu
-- Problem: https://xomdata.com/practice/easy-in-002
-- Solved: 2026-09-09

-- Write your SQL here
SELECT dish_name, category
from dishes
where category not in ('Grill', 'Hotpot');
