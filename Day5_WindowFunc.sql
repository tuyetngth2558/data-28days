SELECT
    id,
    name,
    category,
    cost,
    RANK() OVER (
        PARTITION BY category 
        ORDER BY cost DESC
    ) AS price_rank
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE category IN ('Jeans', 'Swim', 'Tops') 
ORDER BY category, price_rank
LIMIT 20;
