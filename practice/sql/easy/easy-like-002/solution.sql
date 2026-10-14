-- Xom Data · Sales division employees
-- Problem: https://xomdata.com/practice/easy-like-002
-- Solved: 2026-10-14

-- Write your SQL here
with sal_tb as (
    select employee_code, full_name
    from employees
    where employee_code Like 'SAL-%'
    group by employee_code, full_name
)
select employee_code, full_name
from sal_tb;
