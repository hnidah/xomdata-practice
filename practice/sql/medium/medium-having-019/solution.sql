-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-10-27

select 
    store_name,
    reputation_score,
    count(o.id) as order_count,
    dense_rank() over( order by count(o.id) desc) as rank_by_orders,
    sum(count(o.id)) OVER (
        ORDER BY count(o.id) desc, store_name
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_orders
from sellers s
    join orders o on s.id = o.seller_id
group by store_name, reputation_score
having reputation_score >= 4.5 
    and count(o.id) >= 3
order by rank_by_orders, store_name
