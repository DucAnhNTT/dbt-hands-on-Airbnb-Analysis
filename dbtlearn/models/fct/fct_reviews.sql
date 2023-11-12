{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}
WITH src_review AS (
    SELECT * FROM {{ ref('src_review') }}
)
SELECT 
    {{ dbt_utils.surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,,
*
 FROM src_review
WHERE review_text is not null
    {% if is_incremental() %}
        AND review_date > (select max(review_date) from {{ this }})
    {% endif %}
