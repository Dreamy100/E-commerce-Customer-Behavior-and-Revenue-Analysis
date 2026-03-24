-- Clean and Prepare Data

CREATE OR REPLACE TABLE `ecommerce_funnel_analysis.clean_data` AS
SELECT
event_time,
DATE(event_time) AS event_date,
order_id,
product_id,
category_id,
category_code,
brand,
SAFE_CAST(price AS FLOAT64) AS price,
user_id
FROM ecommerce_funnel_analysis.events_data
WHERE user_id IS NOT NULL
AND order_id IS NOT NULL
AND price IS NOT NULL
AND DATE(event_time) >= '2020-01-01';

-- Checking the Data Validation of the Newly Created Clean Table (clean_data)

SELECT
  COUNT(DISTINCT user_id) AS total_users,
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(*) AS total_records,
  ROUND(SUM(price),2) AS total_revenue
FROM ecommerce_funnel_analysis.clean_data;