-- Finding out the Top 10 Products

SELECT
product_id,
COUNT(*) AS purchases,
ROUND(SUM(price),2) AS order_total
FROM `ecommerce_funnel_analysis.clean_data`
GROUP BY product_id 
ORDER BY purchases DESC
LIMIT 10;