-- Xom Data · Average score per class
-- Problem: https://xomdata.com/practice/easy-groupby-003
-- Solved: 2026-09-09

-- Write your SQL here
select class_name, round(avg(score),2) as avg_score
from scores
group by class_name
order by class_name;
