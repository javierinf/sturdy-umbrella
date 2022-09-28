With joined AS (
  SELECT 
    a.order_id, 
    b.ingredients 
  FROM 
    Orders a
    LEFT JOIN pizza b ON a.pizza_id = b.id
),
    
 joined_unnested as(    
    SELECT 
    order_id,
    ingredient
    FROM joined a
    CROSS 
    JOIN UNNEST(string_to_array(ingredients, ',')) AS ingredient  
),
 
 ingredient_count_FROM_pizza AS (
    SELECT 
    order_id,
    name,
    count(0) AS qty
    FROM 
   joined_unnested a
   LEFT JOIN ingredients b ON cast(a.ingredient AS integer) = b.id 
   GROUP BY 1,2
),
   
 extras_unnested AS (
    SELECT 
    order_id,
    nullif(ingredient,'null') AS ingredient
    FROM orders a
    CROSS 
    JOIN UNNEST(string_to_array(extras, ',')) AS ingredient 
),
 
 ingredient_count_FROM_extras AS (
    SELECT 
    order_id,
    name,
    count(0) AS qty
    FROM 
   extras_unnested a
   LEFT JOIN ingredients b ON cast(a.ingredient AS integer) = b.id 
   where ingredient is not null and ingredient <> 'null'
   GROUP BY 1,2   
),

 exclusions_unnested AS (
    SELECT 
    order_id,
    nullif(ingredient,'null') AS ingredient
    FROM orders a
    CROSS 
    JOIN UNNEST(string_to_array(exclusions, ',')) AS ingredient 
),
 
 ingredient_count_FROM_exclusions AS (
    SELECT 
    order_id,
    name,
    -1*count(0) AS qty
    FROM 
   exclusions_unnested a
   LEFT JOIN ingredients b ON cast(a.ingredient AS integer) = b.id 
   GROUP BY 1,2   
),

ingredient_count AS (
  SELECT order_id,
  name,
  sum(qty) AS qty
  FROM(
  SELECT * FROM ingredient_count_FROM_extras 
  UNION ALL
  SELECT * FROM ingredient_count_FROM_pizza
   UNION ALL
   SELECT * FROM ingredient_count_FROM_exclusions) a
  GROUP BY 1,2
  )
   
  SELECT 
  order_id,
  STRING_AGG(
  CASE 
    WHEN qty>1 THEN qty || 'x' ||name 
    WHEN qty = 1 THEN name
    END,',' ORDER BY qty DESC
  ) AS recipe
  FROM ingredient_count
  GROUP BY 1