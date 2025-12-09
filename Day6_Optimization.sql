CREATE OR REPLACE TABLE `day6_practice.orders_optimized`
PARTITION BY DATE(created_at) 
CLUSTER BY status             
AS
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.orders`;
