SELECT
    order_id,
    status,
    created_at, -- Sửa đúng chính tả
    shipped_at, -- Sửa đúng chính tả
    CASE 
        WHEN shipped_at IS NULL THEN 'Not Shipped Yet'
        ELSE 'Shipped'
    END AS delivery_status -- Bỏ dấu phẩy ở đây
FROM `bigquery-public-data.thelook_ecommerce.orders` -- Đổi thành bảng ORDERS
LIMIT 20;
