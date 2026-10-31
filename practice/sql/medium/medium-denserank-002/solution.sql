-- Xom Data · Salary bands within each department
-- Problem: https://xomdata.com/practice/medium-denserank-002
-- Solved: 2026-10-31

-- Write your SQL here
SELECT
    DEPARTMENT,
    DENSE_RANK() over(PARTITION BY department ORDER BY salary desc) as salary_tier,
    full_name,
    salary
from employees
ORDER BY department, salary_tier, full_name
