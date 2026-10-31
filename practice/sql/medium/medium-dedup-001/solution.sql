-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-10-31

-- Write your SQL here
select 
    customer_name,
    phone,
    updated_date
from contact_updates c
where updated_date = (select max(updated_date) from contact_updates c2
                        where c.customer_name = c2.customer_name)
order by customer_name
