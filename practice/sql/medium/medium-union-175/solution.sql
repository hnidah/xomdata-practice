-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-11-05

/*with uni_tab as (
    select
        'Complaint' as type,
        coalesce(count(id), 0) as quantity
    from complaints
    where status = 'Pending'
UNION ALL
    select
        'Cancelled Order' as type,
        coalesce(count(id), 0) as quantity
    from orders
    where status = 'Cancelled'
UNION ALL
    select
        'Out of Stock Product' as type,
        coalesce(count(id), 0) as quantity
    from products
    where status = 'Out of Stock'
)
, rank_tab as (
    select 
        *,
        round(quantity * 100.0/ nullif(sum(quantity) over(), 0), 2) as pct_of_total,
        rank() over(order by quantity desc) as rank_pos
    from uni_tab
)
select 
    *, 
    round(sum(pct_of_total) over(order by rank_pos, type 
        rows between unbounded preceding and current row), 2) as cumulative_pct
from rank_tab
order by rank_pos, type
*/
WITH
  CTE AS (
    SELECT
      'Complaint' AS type,
      COUNT(*) quantity
    FROM
      complaints
    WHERE
      status = 'Pending'
    UNION ALL
    SELECT
      'Cancelled Order' AS type,
      COUNT(*) quantity
    FROM
      orders
    WHERE
      status = 'Cancelled'
    UNION ALL
    SELECT
      'Out of Stock Product' AS type,
      COUNT(*) quantity
    FROM
      products
    WHERE
      status = 'Out of Stock'
  ),
  CTE1 AS (
    SELECT
      *,
        quantity * 100.00 / NULLIF(SUM(quantity) OVER (), 0)
      AS pct_of_total,
      RANK() OVER (
        ORDER BY
          quantity DESC
      ) AS rank_pos
    FROM
      CTE
  )
SELECT
  type, quantity, ROUND(pct_of_total, 2) as pct_of_total, rank_pos,
  ROUND(SUM(pct_of_total) OVER (
    ORDER BY
      pct_of_total DESC, type ASC ROWS BETWEEN UNBOUNDED PRECEDING
      AND CURRENT ROW
  ), 2) AS cumulative_pct
FROM
  CTE1
ORDER BY
  rank_pos ASC,
  type ASC
