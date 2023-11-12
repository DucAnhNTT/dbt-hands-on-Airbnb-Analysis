

WITH  __dbt__cte__src_host as (
WITH raw_hosts as(
    select * from airbnb.raw.raw_hosts
)
select 
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at
from raw_hosts
), src_host AS (
    SELECT
    *
    FROM
    __dbt__cte__src_host
)
SELECT
    host_id,
    NVL(
     host_name,
     'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
src_host