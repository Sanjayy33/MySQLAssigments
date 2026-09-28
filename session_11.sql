CREATE DATABASE subquery_assignment;
USE subquery_assignment;

# 1. Find restaurants whose average rating is higher than the overall average rating

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(3,2)
);

INSERT INTO Restaurants (id, name, rating)
VALUES
(1, 'Food Palace', 4.50),
(2, 'Spice Hub', 4.20),
(3, 'Taste House', 4.80),
(4, 'Green Garden', 3.90),
(5, 'Royal Restaurant', 4.60);

SELECT
    name,
    rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);


# 2. Display each user's name with total number of orders

CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

INSERT INTO Users (id, name)
VALUES
(1, 'Sanjay'),
(2, 'Rahul'),
(3, 'Priya'),
(4, 'Amit');

INSERT INTO Orders (id, user_id, order_date)
VALUES
(101, 1, '2026-09-01'),
(102, 1, '2026-09-05'),
(103, 2, '2026-09-10'),
(104, 1, '2026-09-15'),
(105, 3, '2026-09-20');

SELECT
    name,
    (
        SELECT COUNT(*)
        FROM Orders
        WHERE Orders.user_id = Users.id
    ) AS total_orders
FROM Users;


# 3. List movies that have at least one 5-star review

CREATE TABLE Movies (
    id INT PRIMARY KEY,
    movie_name VARCHAR(100)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    movie_id INT,
    rating INT
);

INSERT INTO Movies (id, movie_name)
VALUES
(1, 'Inception'),
(2, 'Interstellar'),
(3, 'Avatar'),
(4, 'Titanic');

INSERT INTO Reviews (id, movie_id, rating)
VALUES
(1, 1, 5),
(2, 1, 4),
(3, 2, 5),
(4, 3, 3),
(5, 4, 4);

SELECT
    movie_name
FROM Movies
WHERE id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);


# 4. Find sellers who have sold products in every category

CREATE TABLE Sellers (
    id INT PRIMARY KEY,
    seller_name VARCHAR(100)
);

CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    seller_id INT,
    category_id INT
);

INSERT INTO Sellers (id, seller_name)
VALUES
(1, 'ABC Traders'),
(2, 'Tech World'),
(3, 'Smart Store');

INSERT INTO Categories (id, category_name)
VALUES
(1, 'Mobiles'),
(2, 'Laptops'),
(3, 'Accessories');

INSERT INTO Products (id, product_name, seller_id, category_id)
VALUES
(1, 'iPhone', 1, 1),
(2, 'Dell Laptop', 1, 2),
(3, 'USB Cable', 1, 3),
(4, 'Samsung Phone', 2, 1),
(5, 'HP Laptop', 2, 2),
(6, 'Mouse', 3, 3);

# Find sellers who have products in every category

SELECT
    seller_name
FROM Sellers s
WHERE NOT EXISTS (
    SELECT 1
    FROM Categories c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Products p
        WHERE p.seller_id = s.id
        AND p.category_id = c.id
    )
);
```
