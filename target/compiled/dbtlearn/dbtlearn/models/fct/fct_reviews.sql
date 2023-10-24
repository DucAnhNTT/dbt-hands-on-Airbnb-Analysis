
WITH  __dbt__cte__src_review as (
WITH raw_reviews as(
    select * from airbnb.raw.raw_reviews
)
select 
    listing_id,
    date as review_date,
    comments as review_text,
    sentiment as review_sentiment
from raw_reviews
), src_review AS (
    SELECT * FROM __dbt__cte__src_review
)
SELECT * FROM src_review
WHERE review_text is not null
    
        AND review_date > (select max(review_date) from airbnb.dev.fct_reviews)
    