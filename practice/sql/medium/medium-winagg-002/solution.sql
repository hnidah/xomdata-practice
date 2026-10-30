-- Xom Data · Product share within its store
-- Problem: https://xomdata.com/practice/medium-winagg-002
-- Solved: 2026-10-30

-- Write your SQL here
with cte as (select store, 
    product, 
    amount,
    sum(amount) over (partition by store) as total_store
from store_sales)
select store, 
    product, 
    amount,
    round(amount*100.0/total_store, 2) as pct_of_store
from cte 
order by store, product
