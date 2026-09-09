-- Xom Data · Which sales channel leads in orders
-- Problem: https://xomdata.com/practice/easy-groupby-004
-- Solved: 2026-09-09

-- Write your SQL here
select channel, count(order_code) as num_orders 
from orders
group by channel
order by count(order_code) desc, channel;
