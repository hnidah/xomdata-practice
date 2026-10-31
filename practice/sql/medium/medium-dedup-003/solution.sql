-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-10-31

-- Write your SQL here
with cte as (
    select 
        DISTINCT sensor_name, 
        reading_date,
        temp_c,
        max_temp,
        ROW_NUMBER() over(partition by sensor_name order by reading_date desc) as rnk
    from sensors
    join readings r on sensors.id = r.sensor_id 
)
select DISTINCT sensor_name, 
        reading_date,
        temp_c,
        max_temp,
        case when temp_c > max_temp then 'Alert'
        else 'Normal'
        end as status
    from cte
where rnk = 1 
    order by sensor_name
