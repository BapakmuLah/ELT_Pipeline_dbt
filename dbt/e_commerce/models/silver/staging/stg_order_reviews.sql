-- REMOVE ALL DUPLICATE REVIEW_ID --

SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY review_id ORDER BY review_creation_date DESC) as rn
               FROM {{ref('olist_order_reviews_dataset')}}) 
WHERE rn = 1