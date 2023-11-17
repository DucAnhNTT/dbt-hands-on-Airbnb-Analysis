

WITH  __dbt__cte__src_review as (
WITH raw_reviews as(
    select * from airbnb.raw.raw_reviews
)
select 
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
from raw_reviews
), src_reviews AS (
    SELECT * FROM __dbt__cte__src_review
)
SELECT
    md5(cast(coalesce(cast(listing_id as 
    varchar
), '') || '-' || coalesce(cast(review_date as 
    varchar
), '') || '-' || coalesce(cast(reviewer_name as 
    varchar
), '') || '-' || coalesce(cast(review_text as 
    varchar
), '') as 
    varchar
))
AS review_id,
    *
FROM src_reviews
WHERE review_text is not null
    
AND review_date > (select max(review_date) from airbnb.dev.fct_reviews)
    