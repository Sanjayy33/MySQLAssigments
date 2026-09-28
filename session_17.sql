CREATE DATABASE restaurant_assignment;
USE restaurant_assignment;

# 1. Create Restaurant table and insert sample data

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(100),
    location VARCHAR(100),
    average_rating DECIMAL(3,2)
);

INSERT INTO Restaurant
(id, name, cuisine, location, average_rating)
VALUES
(1, 'Spice Garden', 'Indian', 'Ahmedabad', 4.50),
(2, 'La Bella', 'Italian', 'Ahmedabad', 4.30),
(3, 'Dragon House', 'Chinese', 'Surat', 4.20),
(4, 'Tandoori Tales', 'Indian', 'Vadodara', 4.60),
(5, 'Pizza Point', 'Italian', 'Ahmedabad', 4.10);


# 2. Count restaurants for each cuisine

SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;


# 3. Create Review table and insert 10 sample reviews

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(3,2),
    review_date DATE
);

INSERT INTO Review
(id, restaurant_id, user_name, rating, review_date)
VALUES
(1, 1, 'Sanjay', 5.00, '2026-09-01'),
(2, 1, 'Rahul', 4.00, '2026-09-03'),
(3, 1, 'Priya', 4.50, '2026-09-05'),
(4, 2, 'Amit', 4.00, '2026-09-02'),
(5, 2, 'Neha', 4.50, '2026-09-04'),
(6, 3, 'Ravi', 4.00, '2026-09-06'),
(7, 3, 'Karan', 4.50, '2026-09-08'),
(8, 4, 'Mehul', 5.00, '2026-09-07'),
(9, 4, 'Ankit', 4.50, '2026-09-09'),
(10, 5, 'Pooja', 4.00, '2026-09-10');


# 4. Display each restaurant with its average review rating

SELECT
    r.name,
    r.cuisine,
    ROUND(AVG(rv.rating), 2) AS average_review_rating
FROM Restaurant r
INNER JOIN Review rv
    ON r.id = rv.restaurant_id
GROUP BY
    r.id,
    r.name,
    r.cuisine
ORDER BY average_review_rating DESC;


# 5. Rank restaurants by average review rating within each cuisine

WITH RestaurantRatings AS (
    SELECT
        r.id,
        r.name,
        r.cuisine,
        ROUND(AVG(rv.rating), 2) AS average_rating
    FROM Restaurant r
    INNER JOIN Review rv
        ON r.id = rv.restaurant_id
    GROUP BY
        r.id,
        r.name,
        r.cuisine
)
SELECT
    name,
    cuisine,
    average_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY average_rating DESC
    ) AS restaurant_rank
FROM RestaurantRatings
ORDER BY cuisine, restaurant_rank;