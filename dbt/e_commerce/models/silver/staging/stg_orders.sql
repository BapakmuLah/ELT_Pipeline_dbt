-- PERBAIKI APA YG FAIL DI DBT TEST olist_orders_dataset --

WITH source AS (SELECT * FROM {{ ref('olist_orders_dataset') }}),

-- BERSIHKAN KOLOM (TRIM, LOWER, COCOKKAN TIPE DATA)
cleaned AS (
    SELECT TRIM(order_id) AS order_id,
           TRIM(customer_id) AS customer_id,
           LOWER(TRIM(order_status)) AS order_status,

            -- TIMESTAMPS
           CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_timestamp,
           CAST(order_approved_at AS TIMESTAMP) AS order_approved_at,
           CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_date,
           CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_date,
           CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_date
    FROM source
),

-- PENAMBAHAN BEBERAPA KOLOM (ANOMALY KOLOM & DATEDIFF)
enriched AS (
    SELECT *,

        -- CHECK ANOMALY FLAGS --
        CASE 
            WHEN order_delivered_carrier_date IS NOT NULL 
             AND order_approved_at IS NOT NULL
             AND order_delivered_carrier_date < order_approved_at
            THEN 1 ELSE 0
        END AS is_anomaly_carrier_before_approved,

        CASE 
            WHEN order_delivered_customer_date IS NOT NULL 
             AND order_delivered_carrier_date IS NOT NULL
             AND order_delivered_customer_date < order_delivered_carrier_date
            THEN 1 ELSE 0
        END AS is_anomaly_customer_before_carrier,

        -- HITUNG LAMANYA DELIVERY
        DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) AS delivery_days,  -- MENGHITUNG LAMANYA DELIVERY HINGGA SAMPAI KE TANGAN CUSTOMER
        DATEDIFF(order_estimated_delivery_date, order_purchase_timestamp) AS estimated_delivery_days, -- RATA-RATA LAMANYA PENGIRIMAN YG DIJANJIKAN 

        -- CHECK APAKAH LAMANYA PENGIRIMAN MELEBIHI LAMANYA PENGIRIMAN YG DIJANJIKAN
        CASE WHEN order_delivered_customer_date IS NOT NULL
                AND order_estimated_delivery_date IS NOT NULL
                AND order_delivered_customer_date > order_estimated_delivery_date
            THEN 1 ELSE 0
        END AS is_late_delivery
    FROM cleaned
),

final AS (
    SELECT *,
        -- ANOMALY LEVELS --
        CASE
            WHEN is_anomaly_customer_before_carrier = 1 THEN 'critical'
            WHEN is_anomaly_carrier_before_approved = 1 THEN 'warning'
            ELSE 'normal'
        END AS anomaly_level
    FROM enriched
)

SELECT * FROM final