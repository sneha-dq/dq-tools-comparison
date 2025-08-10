



select
    1
from "others"."public"."customer_shopping"

where not(price ::numeric > 0)

