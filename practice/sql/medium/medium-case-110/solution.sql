-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-10-29

with cte as (
  SELECT
    name,
    categories,
    sum(quantity) AS total_sold,
    CASE
      WHEN sum(quantity) >= 100 THEN 'Best Seller'
      WHEN sum(quantity) < 50 THEN 'Slow Mover'
      ELSE 'Average'
    END AS classification
  from products p
  join transactions t on p.id = t.product_id
  group by name, categories
)
select *,
  dense_rank() over(partition by categories order by total_sold desc) as rank_in_cat,
  round(total_sold *100.0/ sum(total_sold) over(partition by categories),2) as pct_of_cat_total
from cte
order by categories, rank_in_cat, name
