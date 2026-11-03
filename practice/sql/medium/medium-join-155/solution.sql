-- Xom Data · Rank hotels by room price within each destination
-- Problem: https://xomdata.com/practice/medium-join-155
-- Solved: 2026-11-03

with cte as (
    select 
        distinct hotel_name,
        star_class,
        destination_name,
        count(hr.id) over(partition by hotel_name) as room_count,
        min(nightly_rate) over(partition by hotel_name) as min_price,
        max(nightly_rate) over(partition by hotel_name) as max_price,
        avg(nightly_rate) over(partition by hotel_name) as avg_price
    from hotels h
    left join destinations d on h.destination_id = d.id
    left join hotel_rooms hr on h.id = hr.hotel_id
)
select *,
    max_price - min_price as price_spread,
    rank() over(partition by destination_name order by avg_price desc) as rank_in_destination
from cte
where room_count >= 2
order by destination_name, rank_in_destination, hotel_name
