-- back compat for old kwarg name
  
  begin;
    

        insert into airbnb.dev.fct_reviews ("LISTING_ID", "REVIEW_DATE", "REVIEW_TEXT", "REVIEW_SENTIMENT")
        (
            select "LISTING_ID", "REVIEW_DATE", "REVIEW_TEXT", "REVIEW_SENTIMENT"
            from airbnb.dev.fct_reviews__dbt_tmp
        );
    commit;