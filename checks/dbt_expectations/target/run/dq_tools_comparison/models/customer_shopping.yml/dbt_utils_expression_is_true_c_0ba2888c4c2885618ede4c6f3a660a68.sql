
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  



select
    1
from "others"."public"."customer_shopping"

where not(price ::integer > 0)


  
  
      
    ) dbt_internal_test