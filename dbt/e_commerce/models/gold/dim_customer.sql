-- RIWAYAT TRANSAKSI SETIAP CUSTOMER

select customer_unique_id,
       min(order_purchase_timestamp) as first_order_date, -- PERTAMA KALI CUSTOMER MEMESAN
       max(order_purchase_timestamp) as last_order_date,  -- TERAKHIR KALI CUSTOMER ORDER
       count(distinct(order_id)) as total_orders          -- TOTAL ORDER DALAM RENTANG WAKTU TERSEBUT
FROM {{ ref("int_orders") }}
GROUP BY customer_unique_id
