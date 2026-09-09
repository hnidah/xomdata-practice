-- Xom Data · The cafe's average rating
-- Problem: https://xomdata.com/practice/easy-avg-002
-- Solved: 2026-09-09

-- Write your SQL here
SELECT round(avg(rating),2) as avg_rating
from reviews;
