-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-11-06

with cte as (
    select 
        distinct subject_name,
        credits,
        count(g.id) over(partition by subject_name) as student_count,
        avg(final_score) over(partition by subject_name) as avg_score,
        sum(case when final_score >=5 then 1 else 0 end) over(partition by subject_name) *100.0/nullif(count(*) over(partition by subject_name), 0) as pass_rate
    from subjects s
    left join grades g on s.id = g.subject_id
)
, cte2 as (
    select 
        subject_name,
        credits,
        student_count,
        round(avg_score, 2) as avg_score,
        round(pass_rate, 2) as pass_rate,
        rank() over(order by avg_score desc) as rank_by_avg
from cte
)
select *,
    ntile(4) over(order by avg_score desc, subject_name) as difficulty_quartile
from cte2
order by rank_by_avg, subject_name
