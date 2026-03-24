-- Revenue by Category
SELECT
category_code,
ROUND(SUM(price),2) AS total_revenue,
COUNT(DISTINCT(order_id)) AS total_orders
FROM `ecommerce_funnel_analysis.clean_data` 
GROUP BY category_code
ORDER BY total_revenue DESC;

-- Revenue by Brands
SELECT
brand,
ROUND(SUM(price),2) AS total_revenue,
COUNT(DISTINCT(order_id)) AS total_orders
FROM `ecommerce_funnel_analysis.clean_data` 
GROUP BY brand
ORDER BY total_revenue DESC;
