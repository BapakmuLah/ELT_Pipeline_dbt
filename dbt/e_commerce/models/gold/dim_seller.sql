-- INFORMASI SINGKAT TENTANG SELLERS 

select distinct seller_id,
                seller_state
from {{ ref('stg_sellers') }}