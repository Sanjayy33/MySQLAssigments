
CREATE DATABASE cte_assignment;
USE cte_assignment;

# 1. CTE to find products with rating above 4.5

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    rating DECIMAL(3,2)
);

INSERT INTO Products (id, product_name, rating)
VALUES
(1, 'iPhone', 4.80),
(2, 'Samsung Galaxy', 4.60),
(3, 'Laptop', 4.30),
(4, 'Headphones', 4.70),
(5, 'Smart Watch', 4.20);

WITH TopRatedProducts AS (
    SELECT
        id,
        product_name,
        rating
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;


# 2. Find Ahmedabad restaurants with delivery charges under 50

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    delivery_charge DECIMAL(10,2)
);

INSERT INTO Restaurants (id, name, city, delivery_charge)
VALUES
(1, 'Food Palace', 'Ahmedabad', 30.00),
(2, 'Spice Hub', 'Ahmedabad', 60.00),
(3, 'Taste House', 'Surat', 40.00),
(4, 'Green Garden', 'Ahmedabad', 45.00);

# Using a subquery

SELECT *
FROM (
    SELECT *
    FROM Restaurants
) AS restaurant_data
WHERE city = 'Ahmedabad'
AND delivery_charge < 50;

# Using a CTE

WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
)
SELECT *
FROM AhmedabadRestaurants
WHERE delivery_charge < 50;

# The CTE version is more readable because the temporary result has a meaningful name.


# 3. Top 3 most-followed users and top 3 most-liked posts

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100),
    followers INT
);

CREATE TABLE Posts (
    id INT PRIMARY KEY,
    user_id INT,
    post_title VARCHAR(100),
    likes INT
);

INSERT INTO Users (id, username, followers)
VALUES
(1, 'Sanjay', 2500),
(2, 'Rahul', 5000),
(3, 'Priya', 3500),
(4, 'Amit', 1800),
(5, 'Neha', 4200);

INSERT INTO Posts (id, user_id, post_title, likes)
VALUES
(1, 1, 'Travel Photo', 1500),
(2, 2, 'Food Photo', 3200),
(3, 3, 'Nature Photo', 2100),
(4, 4, 'Coding Photo', 900),
(5, 5, 'Fitness Photo', 2800);

WITH TopUsers AS (
    SELECT
        username,
        followers
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT
        post_title,
        likes
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT
    'Top Users' AS list_type,
    username AS name,
    followers AS count_value
FROM TopUsers

UNION ALL

SELECT
    'Top Posts' AS list_type,
    post_title AS name,
    likes AS count_value
FROM TopPosts;


# 4. Recursive CTE to generate dates for the next 7 days

WITH RECURSIVE DateList AS (
    SELECT CURDATE() AS booking_date

    UNION ALL

    SELECT DATE_ADD(booking_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE booking_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT booking_date
FROM DateList;


# 5. CTE to find users with more than 1000 followers

WITH UserFollowerData AS (
    SELECT
        id,
        username,
        followers
    FROM Users
)
SELECT
    id,
    username,
    followers
FROM UserFollowerData
WHERE followers > 1000;
```
