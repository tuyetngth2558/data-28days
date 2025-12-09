WITH customer_spending AS (
    SELECT
        user_id,
        SUM(sale_price) AS total_spend 
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
    WHERE status = 'Complete'
      AND EXTRACT (YEAR from created_at)  = 2023 
    GROUP BY user_id
),
ranked_customers AS (
    SELECT
        u.first_name,
        u.last_name,
        u.country,
        cs.total_spend,
        CASE
            WHEN cs.total_spend > 500 THEN 'Diamond'
            ELSE 'Gold'
        END AS customer_segment,

        RANK() OVER (
            PARTITION BY country 
            ORDER BY  cs.total_spend  DESC 
        ) AS rank_in_country

    FROM customer_spending AS cs
    JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
        ON cs.user_id = u.id 
)
SELECT *
FROM ranked_customers
WHERE rank_in_country = 1
ORDER BY total_spend DESC; 
