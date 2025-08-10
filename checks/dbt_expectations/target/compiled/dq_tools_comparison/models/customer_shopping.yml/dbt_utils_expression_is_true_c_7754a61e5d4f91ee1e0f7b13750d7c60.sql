



select
    1
from "others"."public"."customer_shopping"

where not(quantity ::integer > 0)

