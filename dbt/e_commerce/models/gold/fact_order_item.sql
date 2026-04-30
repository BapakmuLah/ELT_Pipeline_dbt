select order_id,
       order_item_id,

       product_id,
       seller_id,

       product_category,
       seller_state,

       price,
       freight_value,
       total_item_value,

       shipping_limit_date
from {{ ref('int_order_items') }}