-- ADJUST DATA TYPE OLIST SELLERS --

SELECT CAST(seller_id as STRING) as seller_id,
       CAST(seller_zip_code_prefix as STRING) as seller_zip_code_prefix,
       CAST(seller_city as STRING) as seller_city,
       CAST(seller_state as STRING) as seller_state
FROM e_commerce_elt.bronze.olist_sellers_dataset