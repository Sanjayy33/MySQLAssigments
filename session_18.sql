# 1. Find artists who have uploaded more than 3 songs

SELECT
    artist_name,
    COUNT(*) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(*) > 3;


# 2. Display each username with their total order amount

SELECT
    u.username,
    SUM(o.amount) AS total_order_amount
FROM users u
INNER JOIN orders o
    ON u.user_id = o.user_id
GROUP BY
    u.user_id,
    u.username;


# 3. Find restaurants with rating higher than the average rating

SELECT
    name,
    rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);


# 4. Display each user's transaction amount and running total

SELECT
    user_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
ORDER BY user_id, transaction_date;


# 5. Query optimizations for filtering products by category and price

# Optimization 1: Create a composite index on category and price

CREATE INDEX idx_category_price
ON products (category_id, price);

# This allows the database to find products by category and price
# more efficiently instead of scanning the entire products table.

# Optimization 2: Filter using WHERE conditions directly

SELECT
    product_id,
    product_name,
    category_id,
    price
FROM products
WHERE category_id = 5
AND price BETWEEN 500 AND 2000;

# Using direct WHERE conditions avoids unnecessary subqueries
# or extra operations and allows the optimizer to use the index efficiently.
