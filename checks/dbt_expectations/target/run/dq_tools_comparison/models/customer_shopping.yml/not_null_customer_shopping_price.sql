
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select price
from "others"."public"."customer_shopping"
where price is null



  
  
      
    ) dbt_internal_test