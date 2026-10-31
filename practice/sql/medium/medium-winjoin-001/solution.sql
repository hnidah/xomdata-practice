-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-10-31

-- Write your SQL here
select 
    dept_name,
    rank() over(PARTITION BY dept_id order by sales_amount desc) as dept_rank,
    staff_name,
    sales_amount
from departments
join staff on departments.id = staff.dept_id
order by dept_name, dept_rank, staff_name
