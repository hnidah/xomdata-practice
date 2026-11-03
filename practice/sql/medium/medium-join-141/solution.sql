-- Xom Data · Consultation revenue by doctor
-- Problem: https://xomdata.com/practice/medium-join-141
-- Solved: 2026-11-03

with cte as (
    select 
        distinct faculty_name,
        full_name as doctor_name,
        count(m.id) over(PARTITION BY full_name) as visit_count,
        avg(visit_fee) over(PARTITION BY full_name) as avg_exam_fee,
        sum(visit_fee) over(PARTITION BY full_name) as total_exam_fee
    from doctors d
    left join faculties f on f.id =d.faculty_id
    left join medical_visits m on m.doctor_id = d.id 
)
select *,
    rank() over(ORDER BY total_exam_fee desc) as overall_rank,
    DENSE_RANK () over(PARTITION BY faculty_name order by total_exam_fee desc) as rank_in_faculty
from cte
order by total_exam_fee desc, doctor_name
limit 15
