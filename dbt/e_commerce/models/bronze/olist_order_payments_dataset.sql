-- ADJUST DATA TYPE ORDER PAYMENTS --

SELECT CAST(order_id as STRING) as order_id,
       CAST(payment_sequential as INT) as payment_sequential,
       CAST(payment_type as STRING) as payment_type,
       CAST(payment_installments as INT) as payment_installments,
       CAST(payment_value as DECIMAL(10, 2)) as payment_value
FROM e_commerce_elt.bronze.olist_order_payments_dataset

