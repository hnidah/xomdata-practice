-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-10-28

-- Write your SQL here
select region,
    staff_name,
    salary,
    sum(salary) over(partition by region) as region_total,
    round(100.0*salary/sum(salary) over(partition by region),2) as pct_of_region
from payroll
order by region, salary desc, staff_name
