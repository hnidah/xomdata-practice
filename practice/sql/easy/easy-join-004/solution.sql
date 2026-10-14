-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-10-14

-- Write your SQL here
select start_time, title, screen
from movies m
join showtimes s on m.id = s.movie_id
order by start_time, title
