-- Xom Data · Monthly store visit rhythm
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-10-28

select left(order_date, 7) as month,
    count(distinct customer_id) as active_customers
from orders
where left(order_date, 7) is not null
group by month
order by month
