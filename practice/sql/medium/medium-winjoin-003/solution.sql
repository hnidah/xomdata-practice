-- Xom Data · Each aisle's best seller
-- Problem: https://xomdata.com/practice/medium-winjoin-003
-- Solved: 2026-11-01

-- Write your SQL here
with cte as (select category_name, 
    product_name,
    units_sold, 
    row_number() over(partition by category_name order by units_sold desc, product_name) as rnk
from categories c
join products p on c.id = p.category_id
)
select category_name, 
    product_name,
    units_sold
from cte
where rnk = 1
order by category_name
