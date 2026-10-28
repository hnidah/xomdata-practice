-- Xom Data · Who stayed loyal all quarter
-- Problem: https://xomdata.com/practice/medium-active-004
-- Solved: 2026-10-28

select customer_id
from orders 
where left(order_date, 7) in ('2024-01', '2024-02', '2024-03')
group by customer_id
having count(distinct left(order_date, 7)) = 3
