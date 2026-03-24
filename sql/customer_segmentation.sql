-- Segmenting Customers Based on their Transaction History
-- Categorize users into VIP, Premium, or Regular based on total spending, then count how many users are in each category

WITH user_monetary AS(
  SELECT
  user_id,
  SUM(price) AS monetary
  FROM `ecommerce_funnel_analysis.clean_data`
  GROUP BY user_id
),

 user_segment AS(
  SELECT
  user_id,
  monetary,
  CASE
    WHEN monetary >= 1000 THEN 'VIP'
    WHEN monetary BETWEEN 500 AND 999.99 THEN 'Premium'
    ELSE 'Regular'
    END AS segment
  FROM user_monetary
)

SELECT
 segment,
  COUNT(user_id) AS user_count
FROM user_segment
GROUP BY segment;