CREATE DATABASE join_assignment;
USE join_assignment;

# 1. Create Influencers and Collaborations tables

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

# Insert sample influencers

INSERT INTO Influencers (id, name)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha');

# Insert sample collaborations

INSERT INTO Collaborations (id, influencer1_id, influencer2_id, collab_date)
VALUES
(1, 1, 2, '2026-01-10'),
(2, 2, 3, '2026-02-15');

# FULL JOIN using LEFT JOIN and UNION

SELECT
    i1.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Influencers i1
LEFT JOIN Collaborations c
    ON i1.id = c.influencer1_id
LEFT JOIN Influencers i2
    ON c.influencer2_id = i2.id

UNION

SELECT
    i2.name AS influencer_name,
    i1.name AS collaboration_partner,
    c.collab_date
FROM Influencers i2
LEFT JOIN Collaborations c
    ON i2.id = c.influencer2_id
LEFT JOIN Influencers i1
    ON c.influencer1_id = i1.id;


# 2. SELF JOIN for nested playlists

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO Playlists (id, user_id, playlist_name, parent_playlist_id)
VALUES
(1, 101, 'My Music', NULL),
(2, 101, 'Workout Songs', 1),
(3, 101, 'Morning Songs', 1),
(4, 101, 'Rock Songs', 2);

SELECT
    child.id,
    child.playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists child
LEFT JOIN Playlists parent
    ON child.parent_playlist_id = parent.id;


# 3. Multiple JOINs to display users, orders and payments

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Users (id, username)
VALUES
(1, 'sanjay'),
(2, 'rahul'),
(3, 'priya');

INSERT INTO Orders (id, user_id, order_date)
VALUES
(101, 1, '2026-09-01'),
(102, 1, '2026-09-05'),
(103, 2, '2026-09-10');

INSERT INTO Payments (id, order_id, amount)
VALUES
(1, 101, 500.00),
(2, 102, 750.00);

SELECT
    u.username,
    o.order_date,
    p.amount
FROM Users u
LEFT JOIN Orders o
    ON u.id = o.user_id
LEFT JOIN Payments p
    ON o.id = p.order_id;


# 4. Remove duplicate restaurants caused by multiple reviews

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating INT,
    review_text VARCHAR(255)
);

INSERT INTO Restaurants (id, name)
VALUES
(1, 'Food Palace'),
(2, 'Spice Hub'),
(3, 'Taste House');

INSERT INTO Reviews (id, restaurant_id, rating, review_text)
VALUES
(1, 1, 5, 'Excellent food'),
(2, 1, 4, 'Good service'),
(3, 2, 5, 'Very tasty');

SELECT DISTINCT
    r.id,
    r.name
FROM Restaurants r
INNER JOIN Reviews rev
    ON r.id = rev.restaurant_id;


# 5. Products and Categories using different JOIN conditions

CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT
);

INSERT INTO Categories (id, category_name)
VALUES
(1, 'Mobiles'),
(2, 'Laptops'),
(3, 'Clothing');

INSERT INTO Products (id, product_name, category_id)
VALUES
(101, 'iPhone', 1),
(102, 'Dell Laptop', 2),
(103, 'T-Shirt', 3);

# JOIN condition 1

SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id;

# JOIN condition 2

SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
    ON c.id = p.category_id;

# Both JOIN conditions are logically the same.
# The database optimizer normally treats them equally when proper indexes exist.
```
