-- RFM Analysis

WITH rfm AS(
  SELECT
  user_id,
  DATE_DIFF(CURRENT_DATE(), MAX(event_date), DAY) AS recency,
  COUNT(order_id) AS frequency,
  ROUND(SUM(price),2) AS monetary
FROM `ecommerce_funnel_analysis.clean_data` 
GROUP BY user_id
)
SELECT user_id,
  recency,
  frequency,
  monetary
  FROM rfm
ORDER BY recency DESC, frequency DESC, monetary DESC;