-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-11-01

with cte as (
select
    distinct movie_name,
    genres,
    count(movie_id) over(partition by movie_name) as showtime_count,
    round(avg(ticket_price) over(PARTITION BY movie_name), 0) as avg_ticket_price
from movies m 
left join showtimes s on m.id = s.movie_id
)
select *,
    dense_rank() over(PARTITION BY genres order by avg_ticket_price desc) as rank_in_genre,
    FIRST_VALUE(movie_name) over(partition by genres order by avg_ticket_price desc) as top_movie_in_genre
from cte
order by genres, rank_in_genre, movie_name
