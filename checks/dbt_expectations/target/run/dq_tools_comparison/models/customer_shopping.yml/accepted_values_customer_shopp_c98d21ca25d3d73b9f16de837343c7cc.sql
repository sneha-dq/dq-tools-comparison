
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        payment_method as value_field,
        count(*) as n_records

    from "others"."public"."customer_shopping"
    group by payment_method

)

select *
from all_values
where value_field not in (
    'Credit Card','Cash','UPI','Debit Card','Net Banking'
)



  
  
      
    ) dbt_internal_test