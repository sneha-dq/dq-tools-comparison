



select
    1
from "others"."public"."customer_shopping"

where not(quantity ::numeric > 0)

