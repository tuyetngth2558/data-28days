SELECT
    order_id,
    status,
    created_at,
    shipped_at, 
    CASE 
        WHEN shipped_at IS NULL THEN 'Not Shipped Yet'
        ELSE 'Shipped'
    END AS delivery_status 
FROM `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 20;
