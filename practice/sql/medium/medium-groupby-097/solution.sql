-- Xom Data · Top 10 most-engaged posts
-- Problem: https://xomdata.com/practice/medium-groupby-097
-- Solved: 2026-10-29

WITH
  cte AS (
    SELECT
      p.id,
       full_name,
      post_type,
      post_date,
      (like_count + comment_count + share_count) AS total_interactions
    FROM
      users u
      JOIN posts p ON u.id = p.user_id
  )
SELECT
  full_name,
  post_type,
  post_date,
  total_interactions,
  rank() OVER (
    ORDER BY
      total_interactions DESC
  ) AS overall_rank,
  row_number() OVER (
    PARTITION BY
      full_name
    ORDER BY
      total_interactions DESC,
      post_date
  ) AS rank_in_author,
  round(
    (total_interactions * 100.0) / max(total_interactions) OVER (),
    2
  ) AS pct_of_top
FROM
  cte
ORDER BY
  overall_rank,
  full_name,
  rank_in_author
LIMIT
  10
