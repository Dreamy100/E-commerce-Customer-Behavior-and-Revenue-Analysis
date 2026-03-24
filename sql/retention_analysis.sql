-- Cohort (Retention Analysis)

-- Find first purchase for each user
WITH first_purchase AS(
  SELECT
  user_id,
  MIN(event_date) AS first_date
  FROM `ecommerce_funnel_analysis.clean_data`
  GROUP BY user_id
),

-- JOIN the first purchase data with the event data
activity AS(
  SELECT
  c.user_id,
  c.first_date,
  e.event_date,
DATE_DIFF(e.event_date,c.first_date,DAY) AS days_since
FROM `ecommerce_funnel_analysis.clean_data` AS e
JOIN first_purchase c USING (user_id)
)

-- Count active users by Cohort and Day
SELECT
first_date,
days_since,
COUNT(DISTINCT user_id) AS active_users
FROM activity
GROUP BY first_date, days_since
ORDER BY first_date, days_since;