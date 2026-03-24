-- Time Series Analysis
-- Detecting Trends and Growth Patterns

SELECT
  event_date,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(price),2) AS revenue
FROM ecommerce_funnel_analysis.clean_data
GROUP BY event_date
ORDER BY event_date;