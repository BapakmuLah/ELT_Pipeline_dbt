-- ADJUST CATEGORY NAME TRANSLATED DATA TYPE --

SELECT LOWER(CAST(product_category_name as STRING)) as product_category_name,
       LOWER(CAST(product_category_name_english as STRING)) as product_category_name_english
FROM {{ ref("product_category_name_translation")}}