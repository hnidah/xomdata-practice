-- Xom Data · The same customer's previous order
-- Problem: https://xomdata.com/practice/medium-winjoin-004
-- Solved: 2026-10-31

-- Write your SQL here
select member_name,
    purchase_date,
    amount,
    lag(amount) over(PARTITION BY member_name order by purchase_date) as prev_amount
from members
join purchases
on members.id = purchases.member_id
order by member_name, purchase_date
