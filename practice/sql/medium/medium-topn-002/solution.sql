-- Xom Data · Top three sellers per category
-- Problem: https://xomdata.com/practice/medium-topn-002
-- Solved: 2026-10-31

-- Write your SQL here
with cte as (
    select category,
    product_name,
    units_sold,
    ROW_NUMBER() over (partition by category order by units_sold desc, product_name) as rnk
from menu_sales
)
select category,
    product_name,
    units_sold
from cte
where rnk <= 3
order by category, units_sold desc, product_name
