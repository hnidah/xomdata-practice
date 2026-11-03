-- Xom Data · Top 10 most-borrowed books
-- Problem: https://xomdata.com/practice/medium-subquery-198
-- Solved: 2026-11-03

with cte as (
    select 
        distinct title,
        full_name as authors,
        publisher_name,
        genre_name,
        count(loan.id) over(PARTITION BY title) as borrow_count,
        case when status = 'ready_pickup' then 1 else 0 end as reserved_rule
    from books b
    left join authors a on b.author_id = a.id
    left join publishers p on p.id = b.publisher_id
    left join genres g on g.id = b.genre_id
    left join book_loans loan on loan.book_id = b.id
    left join reservations r on r.book_id = b.id
),
cte2 as (
    select 
        title,
        authors,
        publisher_name,
        genre_name,
        borrow_count,
        sum(reserved_rule) over (PARTITION BY title) as pending_reservation,
        borrow_count + sum(reserved_rule) over (PARTITION BY title) as engagement
    from cte
)
select *,
        DENSE_RANK() over(order by engagement desc) as overall_rank,
        rank() over(PARTITION BY genre_name order by engagement DESC) as rank_in_genre
from cte2
order by overall_rank, title
limit 10
