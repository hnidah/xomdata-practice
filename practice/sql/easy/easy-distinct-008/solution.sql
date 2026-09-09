-- Xom Data · Countries our students come from
-- Problem: https://xomdata.com/practice/easy-distinct-008
-- Solved: 2026-09-09

-- Write your SQL here
SELECT count(DISTINCT country) as num_countries
from students;
