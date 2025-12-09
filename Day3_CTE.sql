WITH order_counts AS (
    SELECT
        user_id,
        COUNT(order_id) AS total_orders
    FROM `bigquery-public-data.thelook_ecommerce.orders`
    WHERE status = 'Complete' 
    AND EXTRACT(YEAR FROM created_at) = 2023
    GROUP BY user_id
)

SELECT
    t1.first_name,
    t1.last_name,
    t2.total_orders
FROM `bigquery-public-data.thelook_ecommerce.users` AS t1
JOIN order_counts AS t2 
    ON t1.id = t2.user_id
ORDER BY t2.total_orders DESC
LIMIT 5;
