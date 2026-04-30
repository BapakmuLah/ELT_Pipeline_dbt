-- central hub untuk semua analysis order-level

select o.order_id,
       o.customer_id,
       c.customer_unique_id,
       o.order_status,

       o.order_purchase_timestamp,
       o.order_approved_at,
       o.order_delivered_carrier_date,
       o.order_delivered_customer_date,
       o.order_estimated_delivery_date,
       o.is_anomaly_carrier_before_approved,
       o.is_anomaly_customer_before_carrier,

       o.delivery_days,
       o.estimated_delivery_days,
       o.is_late_delivery,
       o.anomaly_level
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    -- GUNAKAN TRIM DAN LOWER DI SINI
    on TRIM(LOWER(o.customer_id)) = TRIM(LOWER(c.customer_id))