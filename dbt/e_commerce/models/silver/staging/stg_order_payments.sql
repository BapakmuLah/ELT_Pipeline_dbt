-- BUANG SEMUA KOLOM YG TIDAK LULUS DBT TEST
SELECT *
FROM {{ ref('olist_order_payments_dataset') }}
WHERE payment_installments >= 1
  AND payment_value > 0;