-- 1. Products from lowest to highest price
SELECT *
FROM products
ORDER BY price ASC;


-- 2. Top 5 most expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;


-- 3. Latest movies first, then highest rated
SELECT *
FROM movies
ORDER BY release_year DESC, rating DESC;


-- 4. First 10 restaurants alphabetically
SELECT *
FROM restaurants
ORDER BY name ASC
LIMIT 10;


-- 5. Top 3 trending songs
-- If play_count is tied, newest song comes first
SELECT *
FROM songs
ORDER BY play_count DESC, added_at DESC
LIMIT 3;