-- Xom Data · Salary by department and title
-- Problem: https://xomdata.com/practice/medium-join-126
-- Solved: 2026-10-31

with cte as (
    select
        distinct department_name,
        position_name,
        count(position_name) over(partition by department_name, position_name) as employee_count,
        avg(net_salary) over(partition by department_name, position_name) as avg_salary,
        min(net_salary) over (partition by department_name, position_name) as min_salary,
        max(net_salary) over (partition by department_name, position_name) as max_salary
    from employees e 
    join positions p on e.position_id = p.id
    join departments d on e.department_id = d.id
    join payroll pay on e.id = pay.employee_id

)
select *,
    max_salary - min_salary as salary_spread,
    rank() over(partition by department_name order by avg_salary desc) as rank_in_dept
from cte
order by department_name, rank_in_dept, position_name
