select o.order_id,
       o.customer_id,
       o.customer_unique_id,

       o.order_status,
       o.order_purchase_timestamp,

       o.delivery_days,
       o.estimated_delivery_days,
       o.is_late_delivery,

       p.total_payment_value,
       p.payment_count,

       r.avg_review_score

from {{ ref('int_orders') }} as o
left join {{ ref('int_payments_aggregated') }} as p
    on o.order_id = p.order_id
left join {{ ref('int_reviews_aggregated') }} as r
    on o.order_id = r.order_id