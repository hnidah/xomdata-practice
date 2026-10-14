-- Xom Data · Books about data
-- Problem: https://xomdata.com/practice/easy-like-003
-- Solved: 2026-10-14

-- Write your SQL here
select title, author
from books
where lower(title) like '%data%';
