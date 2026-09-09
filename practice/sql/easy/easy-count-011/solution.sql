-- Xom Data · Accounts still missing a tax code
-- Problem: https://xomdata.com/practice/easy-count-011
-- Solved: 2026-09-09

-- Write your SQL here
select count(company_name) as missing_tax_code
from accounts
where tax_code is null;
