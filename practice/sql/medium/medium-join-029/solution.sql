-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-11-03

with cte as (
    select distinct full_name,
        academic_degree,
        count(s.id) over(partition by full_name) as subjects_taught
    from lecturers l
    left join subjects s on l.id = s.lecturer_id       
)
select *,
    rank() over(order by subjects_taught desc) as workload_rank,
    sum(subjects_taught) over(order by subjects_taught desc rows between unbounded preceding and current row) as cumulative_subjects
from cte
order by workload_rank, full_name
