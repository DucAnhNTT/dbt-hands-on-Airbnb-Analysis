
  create or replace   view airbnb.dev.src_review
  
   as (
    WITH raw_reviews as(
    select * from AIRBNB.RAW.RAW_REVIEWS
)
select 
    listing_id,
    date as review_date,
    comments as review_text,
    sentiment as review_sentiment
from raw_reviews
  );

