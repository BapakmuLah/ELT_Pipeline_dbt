-- ADJUST CATEGORY NAME TRANSLATED DATA TYPE --

SELECT CAST(product_category_name as STRING) as product_category_name,
       CAST(product_category_name_english as STRING) as product_category_name_english
FROM e_commerce_elt.bronze.product_category_name_translation