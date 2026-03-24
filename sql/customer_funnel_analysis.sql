-- Customer Lifecycle Funnel
-- Finding out the Core Retention Metric

WITH user_order AS(
  SELECT
  user_id, 
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(price) AS total_spent,
  FROM `ecommerce_funnel_analysis.clean_data` 
  GROUP BY user_id
)
SELECT 
COUNT(*) AS total_users,
COUNTIF(user_order.total_orders >= 1) AS one_time_buyers,
COUNTIF(user_order.total_orders >= 2) AS repeat_buyers,
COUNTIF(user_order.total_orders >= 3) AS loyal_customers,
ROUND(COUNTIF(user_order.total_orders >= 2) / COUNT(*),3) AS retention_rate,
COUNTIF(user_order.total_spent >= 100) AS big_spenders,
ROUND(AVG(user_order.total_orders),2) AS avg_orders,
ROUND(AVG(user_order.total_spent),2) AS avg_spent_per_user,
ROUND(SUM(user_order.total_spent),2) AS total_spent
FROM user_order;