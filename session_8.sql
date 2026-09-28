-- Create Orders table
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
user_id INT,
payment_method VARCHAR(50),
amount DECIMAL(10,2)
);

-- Insert sample records
INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
(1, 101, 'UPI', 250.00),
(2, 102, 'Card', 500.00),
(3, 101, 'Wallet', 350.00),
(4, 103, 'UPI', 700.00),
(5, 102, 'COD', 200.00),
(6, 104, 'Card', 450.00),
(7, 103, 'UPI', 300.00),
(8, 104, 'Wallet', 600.00);

SELECT * FROM Orders;

-- Count orders by payment method
SELECT
payment_method,
COUNT(*) AS order_count
FROM Orders
GROUP BY payment_method;

-- Total amount spent by each user
SELECT
user_id,
SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;

-- Payment methods with average order amount greater than 300
SELECT
payment_method,
AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- WHERE filters individual rows
SELECT *
FROM Orders
WHERE amount > 300;

-- HAVING filters groups
SELECT
payment_method,
AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;
