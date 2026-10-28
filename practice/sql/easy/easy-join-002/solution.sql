-- Xom Data · Parcels bound for Denver
-- Problem: https://xomdata.com/practice/easy-join-002
-- Solved: 2026-10-28

-- Write your SQL here
select tracking_code, 
    recipient_name
from recipients r
join parcels p on r.id = p.recipient_id
where city = 'Denver'
