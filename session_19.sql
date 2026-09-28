# Zomato Bangalore SQL Assignment

# 1. Top 5 highest-rated North Indian restaurants in Koramangala
SELECT name, rating, cuisines, location
FROM restaurants
WHERE location LIKE '%Koramangala%'
  AND cuisines LIKE '%North Indian%'
ORDER BY rating DESC
LIMIT 5;

# 2. Average cost for two by cuisine and top 3 most expensive cuisines
SELECT cuisines,
       AVG(approx_cost_for_two) AS average_cost_for_two
FROM restaurants
GROUP BY cuisines
ORDER BY average_cost_for_two DESC
LIMIT 3;

# 3. Restaurants with online delivery and rating below 3.0
SELECT name,
       location,
       cuisines,
       rating,
       approx_cost_for_two,
       online_order
FROM restaurants
WHERE online_order = 'Yes'
  AND rating < 3.0
ORDER BY rating ASC;

# Marketing strategy:
# Analyze location, cuisine, and price of low-rated restaurants.
# Improve food quality, delivery time, customer service, and value for money.
# Focus promotions on locations/cuisines where low ratings are concentrated.

# 4. Segment restaurants by average cost for two
SELECT
    CASE
        WHEN approx_cost_for_two < 400 THEN 'Budget'
        WHEN approx_cost_for_two BETWEEN 400 AND 800 THEN 'Mid-range'
        ELSE 'Premium'
    END AS market_segment,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY
    CASE
        WHEN approx_cost_for_two < 400 THEN 'Budget'
        WHEN approx_cost_for_two BETWEEN 400 AND 800 THEN 'Mid-range'
        ELSE 'Premium'
    END;

# 5. Top 10 restaurant chains by number of outlets
SELECT name AS restaurant_chain,
       COUNT(*) AS outlet_count
FROM restaurants
GROUP BY name
ORDER BY outlet_count DESC
LIMIT 10;

# Validation:
# Check the returned restaurant names and outlet counts against the dataset.
