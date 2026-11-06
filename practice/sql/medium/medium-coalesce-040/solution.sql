-- Xom Data · Book count and average price by genre
-- Problem: https://xomdata.com/practice/medium-coalesce-040
-- Solved: 2026-11-06

with cte as (
    select 
        distinct genre_name,
        count(b.id) as book_count,
        coalesce(round(avg(price), 0), 0) as avg_price,
        coalesce(min(price), 0) as min_price,
        coalesce(max(price), 0) as max_price
    from genres g
    left join books b on g.id = b.genre_id
    group by genre_name
)
select 
    *, 
    coalesce(max_price - min_price, 0) as price_range,
    rank() over(order by book_count desc) as coverage_rank,
    ntile(3) over(order by book_count desc, genre_name) as library_focus
from cte
order by coverage_rank, genre_name
