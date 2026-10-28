-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-10-27

with table_joined as (
    select 
        full_name,
        employee_code,
        avg(work_days) as avg_work_days,
        avg(overtime_hours) as avg_overtime_hours,
        avg(net_salary) as avg_salary,
        round(avg(overtime_hours)/avg(work_days),4) as overtime_intensity
    from employees e 
        join attendance a on e.id = a.employee_id
        join payroll p on p.employee_id = e.id 
    group by full_name, employee_code
    having avg(overtime_hours) > 5 and avg(work_days) >= 18 
)
select *,
    rank() over(order by overtime_intensity desc) as intensity_rank,
    NTILE(4) OVER (ORDER BY overtime_intensity DESC) AS workload_quartile
from table_joined
order by intensity_rank, employee_code
