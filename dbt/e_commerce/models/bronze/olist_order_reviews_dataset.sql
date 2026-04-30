-- ADJUST DATA TYPE ORDER REVIEWS -- 

SELECT CAST(review_id as STRING) as review_id,
       CAST(order_id as STRING) as order_id,
       CAST(review_score as TINYINT) as review_score,
       CAST(review_comment_title as STRING) as review_comment_title,
       CAST(review_comment_message as STRING) as review_comment_message,
       CAST(review_creation_date as TIMESTAMP) as review_creation_date,
       CAST(review_answer_timestamp as TIMESTAMP) as review_answer_timestamp
FROM e_commerce_elt.bronze.olist_order_reviews_dataset