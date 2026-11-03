-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-11-03

with cte as (
    select stu.full_name,
        s.subject_name,
        g.final_score,
        round(cast(avg(g.final_score) over(partition by s.subject_name) as numeric), 2) as subject_avg,
        round(cast(g.final_score - avg(g.final_score) over(partition by s.subject_name) as numeric), 2 ) as diff_from_avg
    from grades g
        left join subjects s on s.id = g.subject_id
        left join students stu on stu.id = g.student_id 
)
select * 
from cte
where final_score > subject_avg
order by diff_from_avg desc, subject_name, full_name
