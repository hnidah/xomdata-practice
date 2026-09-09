-- Xom Data · Sizing parcels by weight
-- Problem: https://xomdata.com/practice/easy-case-002
-- Solved: 2026-09-09

-- Write your SQL here
SELECT
  parcel_code,
  weight_kg,
  CASE
    WHEN weight_kg < '5' THEN 'Small'
    WHEN weight_kg > '20' THEN 'Large'
    ELSE 'Medium'
  END AS size_label
FROM
  parcels;
