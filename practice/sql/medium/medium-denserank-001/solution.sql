-- Xom Data · Price tiers for rooms on sale
-- Problem: https://xomdata.com/practice/medium-denserank-001
-- Solved: 2026-10-30

-- Write your SQL here
select room_no,
    price,
    dense_rank() over(order by price desc) as price_tier
from rooms
order by price_tier, room_no
