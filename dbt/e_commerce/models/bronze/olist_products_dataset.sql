-- ADJUST OLIST ORDERS DATA TYPE --

SELECT CAST(product_id as STRING) as product_id,
       CAST(product_category_name as STRING) as product_category_name,
       CAST(product_name_lenght as SMALLINT) as product_name_length,
       CAST(product_description_lenght as INT) as product_description_length,
       CAST(product_photos_qty as SMALLINT) as product_photos_qty,
       CAST(product_weight_g as INT) as product_weight_g,
       CAST(product_length_cm as SMALLINT) as product_length_cm,
       CAST(product_height_cm as SMALLINT) as product_height_cm,
       CAST(product_width_cm as SMALLINT) as product_width_cm
FROM e_commerce_elt.bronze.olist_products_dataset