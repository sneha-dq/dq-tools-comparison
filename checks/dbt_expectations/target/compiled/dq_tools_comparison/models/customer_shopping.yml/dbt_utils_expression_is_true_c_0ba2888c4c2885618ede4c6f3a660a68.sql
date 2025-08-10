



select
    1
from "others"."public"."customer_shopping"

where not(price ::integer > 0)

