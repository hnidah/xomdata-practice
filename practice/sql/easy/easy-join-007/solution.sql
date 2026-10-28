-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-10-28

-- Write your SQL here
select client_name, 
    count(d.id) as num_deals
from clients c
join deals d on c.id = d. client_id
group by client_name
having count(d.id) >= 1
order by num_deals desc, client_name
