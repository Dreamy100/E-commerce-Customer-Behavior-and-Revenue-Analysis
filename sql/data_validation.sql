-- Checking the Dataset

SELECT * FROM `ecommerce_funnel_analysis.events_data`
LIMIT 10;

-- Checking the Dataset while excluding the Null Values

SELECT * 
FROM `ecommerce_funnel_analysis.events_data`
WHERE event_time IS NOT NULL
  AND order_id IS NOT NULL
  AND product_id IS NOT NULL
  AND category_id IS NOT NULL
  AND brand IS NOT NULL
  AND price IS NOT NULL
  AND user_id IS NOT NULL
LIMIT 20;

-- Counting the Rows

SELECT COUNT(*) AS total_rows
FROM `ecommerce_funnel_analysis.events_data`;

-- Checking Bad Prices

SELECT COUNT(*) AS bad_prices
FROM `ecommerce_funnel_analysis.events_data`
WHERE SAFE_CAST(price AS FLOAT64) IS NULL;

-- Checking Bad Timestamps

SELECT COUNT(*) AS bad_timestamps
FROM `ecommerce_funnel_analysis.events_data`
WHERE event_time IS NULL;

-- Checking the rows where the price is Null

SELECT price, COUNT(*) AS count
FROM `ecommerce_funnel_analysis.events_data`
WHERE SAFE_CAST(price AS FLOAT64) IS NULL
GROUP BY price
ORDER BY count DESC
LIMIT 50;