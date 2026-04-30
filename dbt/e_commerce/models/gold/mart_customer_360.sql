-- analisis profil dan perilaku pelanggan (Customer Profiling) berdasarkan histori transaksi mereka.

select o.customer_unique_id,
       count(distinct o.order_id) as total_orders,
       sum(i.total_item_value) as total_revenue,
       avg(i.total_item_value) as avg_order_value,
       avg(o.delivery_days) as avg_delivery_days,
       avg(o.is_late_delivery) as late_delivery_rate,
       avg(o.avg_review_score) as avg_review_score

from {{ ref('fact_order') }} o
left join {{ ref('fact_order_item') }} i
    on o.order_id = i.order_id

group by o.customer_unique_id