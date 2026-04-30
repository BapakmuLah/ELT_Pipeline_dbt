-- HITUNG RATA-RATA SKOR REVIEW PER ORDER ID (TRANSAKSI)

select order_id,
       avg(review_score) as avg_review_score,
       count(*) as review_count
from {{ ref('stg_order_reviews') }} 
group by order_id