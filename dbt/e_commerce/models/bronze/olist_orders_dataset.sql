-- ADJUST DATA TYPE ORDERS --

SELECT CAST(order_id as STRING) as order_id,
       CAST(customer_id as STRING) as customer_id,
       CAST(order_status as STRING) as order_status,
       CAST(order_purchase_timestamp as TIMESTAMP) as order_purchase_timestamp,
       CAST(order_approved_at as TIMESTAMP) as order_approved_at,
       CAST(order_delivered_carrier_date as TIMESTAMP) as order_delivered_carrier_date,
       CAST(order_delivered_customer_date as TIMESTAMP) as order_delivered_customer_date,
       CAST(order_estimated_delivery_date as TIMESTAMP) as order_estimated_delivery_date
FROM e_commerce_elt.bronze.olist_orders_dataset