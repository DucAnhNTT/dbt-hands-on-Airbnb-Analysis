
SELECT
    * 
FROM
    airbnb.dev.dim_listings_cleansed
WHERE
    minium_nights < 1
