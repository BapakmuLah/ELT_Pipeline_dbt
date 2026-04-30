-- GABUNGKAN NAMA PRODUCTS BAHASA BRAZIL DGN NAMA PRODUCTS BAHASA INGGRIS

SELECT p.product_id,
       trans.product_category_name_english AS product_category, -- NAMA PRODUCT DALAM BAHASA INGGRIS
       p.product_name_length,
       p.product_description_length,
       p.product_photos_qty,
       p.product_weight_g,
       p.product_length_cm,
       p.product_height_cm,
       p.product_width_cm,
       p.is_invalid_weight,
       p.is_invalid_height,
       p.product_volume_cm3,
       p.product_completeness_score,
       p.anomaly_level
FROM {{ ref("stg_products") }} p LEFT JOIN {{ ref("stg_product_category_name") }} trans 
ON p.product_category_name = trans.product_category_name
       