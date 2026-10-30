-- Xom Data · Distance from the class average
-- Problem: https://xomdata.com/practice/medium-winagg-003
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (
    select
        class_name,
        student_name,
        score,
        avg(score) over(partition by class_name) as avg_score
    from scores
)
select
    class_name,
    student_name,
    score,
    round(score - avg_score, 2) as diff_from_avg
from cte
order by class_name, student_name
