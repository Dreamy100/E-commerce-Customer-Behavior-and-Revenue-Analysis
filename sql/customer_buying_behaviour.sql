-- Basket Analysis
-- Finding out the Average Order Size and Customer Buying Behaviour

SELECT
order_id,
COUNT(product_id) AS total_order_size,
ROUND(SUM(price),2) AS order_value 
FROM `ecommerce_funnel_analysis.clean_data`
GROUP BY order_id
ORDER BY order_value DESC;