select
    *
from
    airbnb.dev.dim_listings_cleansed
where minimum_nights < 1
Limit 10