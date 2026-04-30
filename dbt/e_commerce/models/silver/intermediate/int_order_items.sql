-- INFORMASI TENTANG PRODUCT YG TERJUAL, SELLER YG MENJUAL, HARGA, DAN LAMANYA WAKTU PENGIRIMAN

select oi.order_id,
       oi.order_item_id,

       oi.product_id,
       p.product_category,

       oi.seller_id,
       sell.seller_state,

       oi.price,
       oi.freight_value,

       (oi.price + oi.freight_value) as total_item_value,
       oi.shipping_limit_date

from {{ ref('stg_order_items') }} as oi
left join {{ ref('int_products') }} as p
    on oi.product_id = p.product_id
left join {{ ref('stg_sellers') }} as sell
    on oi.seller_id = sell.seller_id