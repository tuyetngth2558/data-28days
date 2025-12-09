SELECT
   status,
   created_at,
   num_of_item  
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Cancelled' 
