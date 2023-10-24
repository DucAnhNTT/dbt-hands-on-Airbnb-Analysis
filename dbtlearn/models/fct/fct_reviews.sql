{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}
WITH src_review AS (
    SELECT * FROM {{ ref('src_review') }}
)
SELECT * FROM src_review
WHERE review_text is not null
    {% if is_incremental() %}
        AND review_date > (select max(review_date) from {{ this }})
    {% endif %}
