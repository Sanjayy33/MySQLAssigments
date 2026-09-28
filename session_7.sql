-- 1. Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);

-- Insert 5 sample orders
INSERT INTO Orders (order_id, user_name, total_amount, order_date)
VALUES
(1, 'Amit', 1500.00, '2026-09-20'),
(2, 'Rahul', 800.50, '2026-09-21'),
(3, 'Amit', NULL, '2026-09-22'),
(4, 'Priya', 2300.75, '2026-09-23'),
(5, 'Rahul', 1200.00, '2026-09-24');

-- 2. Count orders for each user
SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;

-- 3. Calculate average order amount
SELECT AVG(total_amount) AS average_amount
FROM Orders
WHERE total_amount IS NOT NULL;

-- 4. Find highest and lowest order amounts
SELECT
    MAX(total_amount) AS highest_order,
    MIN(total_amount) AS lowest_order
FROM Orders;

-- 5. Calculate total sales
SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;