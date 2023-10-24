{{
    config(
        materialized = 'view'
    )
}}

WITH src_host AS (
    SELECT
    *
    FROM
    {{ ref('src_host') }}
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