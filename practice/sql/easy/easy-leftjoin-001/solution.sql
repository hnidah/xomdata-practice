-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-10-28

-- Write your SQL here
select user_name,
    joined_date
from users
left join rides on users.id = rides.user_id
where user_id is null
