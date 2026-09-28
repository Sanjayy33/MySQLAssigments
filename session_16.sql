
# 1. Import CSV data into FoodOrders table

CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    customer_name VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_date DATE
);

# Import CSV file
# Change the file path according to your CSV file location

LOAD DATA INFILE 'C:/food_orders.csv'
INTO TABLE FoodOrders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, restaurant_name, customer_name, order_amount, order_date);


# 2. Create TopSongs table and insert 5 records

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs
(song_id, song_title, artist, streams, release_date)
VALUES
(1, 'Blinding Lights', 'The Weeknd', 4000000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 3800000000, '2017-01-06'),
(3, 'Someone You Loved', 'Lewis Capaldi', 3000000000, '2018-11-08'),
(4, 'As It Was', 'Harry Styles', 2800000000, '2022-03-31'),
(5, 'Stay', 'The Kid LAROI & Justin Bieber', 2700000000, '2021-07-09');


# 3. Find top 3 customers by total amount spent

SELECT
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;


# 4. Restaurant performance report

SELECT
    restaurant_name,
    COUNT(*) AS number_of_orders,
    SUM(order_amount) AS total_order_amount
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;


# 5. Calculate average order amount and unique customers

SELECT
    'Average Order Amount' AS kpi_name,
    ROUND(AVG(order_amount), 2) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT
    'Total Unique Customers' AS kpi_name,
    COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;
