-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-10-27

select 
    full_name,
    student_code,
    round(avg(final_score), 2) as avg_score,
    case when round(avg(final_score), 2) >=9 then 'Excellent'
        when round(avg(final_score), 2) between 8 and 9 then 'Good'
        when round(avg(final_score), 2) between 7 and 8 then 'Fair'
        when round(avg(final_score), 2) between 5 and 7 then 'Average'
        else 'Poor' end as grade,
    dense_rank() over(order by round(avg(final_score), 2) desc) as class_rank
from students
join scores on students.id = scores.student_id
group by full_name, student_code
order by avg_score desc
limit 20
