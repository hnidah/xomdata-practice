-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (
    select department,
        full_name,
        salary,
        avg(salary) over(partition by department) as avg_sa
    from employees
)
select 
    department,
    full_name,
    salary,
    case when salary > avg_sa then 'Above'
        when salary < avg_sa then 'Below'
        else 'Equal'
        end as position_label
from cte
order by department, full_name
