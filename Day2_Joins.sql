SELECT
    t1.order_id,
    t1.created_at,
    t2.first_name,
    t2.country
FROM `bigquery-public-data.thelook_ecommerce.orders` AS t1
LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` AS t2
    ON t1.user_id = t2.id
WHERE t1.status = 'Shipped'
LIMIT 20;
