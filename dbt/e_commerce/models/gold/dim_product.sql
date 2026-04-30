-- INFORMASI UNTUK SETIAP PRODUCT YG DI ORDER

select distinct product_id,
                product_category,

                product_weight_g,
                product_length_cm,
                product_height_cm,
                product_width_cm

from {{ ref('int_products') }}