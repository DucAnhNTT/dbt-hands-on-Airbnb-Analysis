select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select room_type
from airbnb.dev.dim_listings_cleansed
where room_type is null



      
    ) dbt_internal_test