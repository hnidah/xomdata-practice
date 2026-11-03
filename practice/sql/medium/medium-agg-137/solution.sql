-- Xom Data · Investor trade summary
-- Problem: https://xomdata.com/practice/medium-agg-137
-- Solved: 2026-11-03

-- Summarize buy/sell totals per investor
with cte as (
    SELECT
        distinct full_name,
        segment, 
        count(t.id) as total_trades,
        sum(case when side = 'buy' then amount else 0 end) as total_bought,
        sum(case when side = 'sell' then amount else 0 end) as total_sold
    FROM investors i
    JOIN trades t ON t.investor_id = i.id
    group by full_name, segment
)
select *,
    total_bought - total_sold as net_position,
    case when total_bought > total_sold then 'Bull'
      when total_bought < total_sold then 'Bear'
      else 'Neutral' 
      end as stance,
    DENSE_RANK() over(partition by segment order by (total_bought + total_sold) desc) as rank_in_segment
from cte
order by (total_bought + total_sold) desc, full_name
