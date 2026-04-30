-- ADJUST DATA TYPE OF ORDER ITEMS DATASET --

SELECT CAST(order_id as STRING) as order_id, 
       CAST(order_item_id as INT) as order_item_id,
       CAST(product_id as STRING) as product_id,
       CAST(seller_id as STRING) as seller_id,
       CAST(shipping_limit_date as TIMESTAMP) as shipping_limit_date,
       CAST(price as DECIMAL(12, 2)) as price,
       CAST(freight_value as DECIMAL(12, 2)) as freight_value
FROM e_commerce_elt.bronze.olist_order_items_dataset
