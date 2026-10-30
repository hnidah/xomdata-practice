-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-10-30

-- Write your SQL here
select product_name,
    price, 
    effective_date
from price_history p
where effective_date = (select max(effective_date) from price_history p2
where p.product_name = p2.product_name
)
order by product_name
