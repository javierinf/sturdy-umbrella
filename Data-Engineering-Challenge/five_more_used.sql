WITH orders_pizza_agg AS (
  SELECT 
    pizza_id, 
    count(0) AS ct 
  FROM 
    orders 
  WHERE 
    order_time > CURRENT_DATE - INTERVAL '16 months' 
  GROUP BY 
    1
), 
order_amount AS (
  SELECT 
    string_to_array(ingredients, ',') AS ing_array, 
    ct 
  FROM 
    orders_pizza_agg a 
    LEFT JOIN pizza b ON a.pizza_id = b.id
), 
extras_amount AS (
  SELECT 
    string_to_array(extras, ',') AS ing_array, 
    count(0) AS ct 
  FROM 
    orders 
  WHERE 
    order_time > CURRENT_DATE - INTERVAL '16 months' 
  GROUP BY 
    1
), 
exclusions_amount AS (
  SELECT 
    string_to_array(exclusions, ',') AS ing_array, 
    -1 * count(0) AS ct 
  FROM 
    orders 
  WHERE 
    order_time > CURRENT_DATE - INTERVAL '16 months' 
  GROUP BY 
    1
), 
stage AS (
  SELECT 
    ct, 
    nullif(ingredient,'null') as ingredient 
  FROM 
    exclusions_amount 
    CROSS JOIN UNNEST(ing_array) AS ingredient 
  union all 
  SELECT 
    ct, 
    nullif(ingredient,'null') as ingredient 
  FROM 
    extras_amount 
    CROSS JOIN UNNEST(ing_array) AS ingredient 
  union all 
  SELECT 
    ct, 
    nullif(ingredient,'null') as ingredient 
  FROM 
    order_amount 
    CROSS JOIN UNNEST(ing_array) AS ingredient
) 
SELECT 
  b.name AS ingredient, 
  sum(a.ct) AS sum 
FROM 
  stage a 
  LEFT JOIN Ingredients b ON cast(
    trim(ingredient) AS integer
  ) = b.id 
GROUP BY 
  1 
ORDER BY 
  2 DESC 
LIMIT 
  5
