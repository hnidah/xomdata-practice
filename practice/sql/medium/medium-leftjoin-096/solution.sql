-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-11-01

select full_name,
    username,
    account_type,
    ROW_NUMBER() over(order by created_at, username) as signup_order,
    ntile(4) over(order by created_at) as tenure_quartile
from users u
left join posts p on u.id = p.user_id
where p.id is null
order by signup_order
