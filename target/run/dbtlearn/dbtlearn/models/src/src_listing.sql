
  create or replace   view airbnb.dev.src_listing
  
   as (
    WITH raw_listing as(
    select * from airbnb.raw.raw_listings
)
Select 
    id as listing_id,
    name as listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
from raw_listing
  );

