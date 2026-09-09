-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-09-09

-- Write your SQL here
select p.product_name, s.quantity
, (p.price*s.quantity) as line_total 
from products p
join sale_items s
on p.id = s.product_id;
