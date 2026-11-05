-- Xom Data · A three-digit code says it all
-- Problem: https://xomdata.com/practice/hard-rfm-004
-- Solved: 2026-11-05

with rfm_table as (
    select 
        distinct customer_id,
        cast('2024-06-30' as date) - cast(max(order_date) as date) as Recency,
        count(*) as Frequency,
        sum(amount) as Monetary
    from orders
    group by customer_id
)
, ntile_table as (
    select 
        *,
--- do thang đo là 1 tệ nhất - 5 tốt nhất, mà hàm ntile có quy tắc là nhét số dư vào nhóm ở trên (1) nên khi ghi đúng chiều là recency desc (có nghĩa là recency lớn thì tệ nên số 1) thì sẽ bị nhét vào số 1, mà đề bài yêu cầu số khách lẻ thì các nhóm tốt hơn nhận nhiều khách hơn
        ntile(5) over(order by Recency, customer_id) as r_ntile,
        ntile(5) over(order by Frequency desc, customer_id) as f_ntile,
        ntile(5) over(order by Monetary desc, customer_id) as m_ntile
    from rfm_table
)
select 
    customer_id,
    concat(6 - r_ntile, 6 - f_ntile, 6 - m_ntile) as rfm_code
from ntile_table
order by rfm_code desc, customer_id
