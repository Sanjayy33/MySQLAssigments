
CREATE DATABASE orders_window_assignment;
USE orders_window_assignment;

# 1. Create Orders table and insert sample data

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, user_id, order_date, total_amount)
VALUES
(1, 101, '2026-09-01', 450.00),
(2, 101, '2026-09-05', 650.00),
(3, 101, '2026-09-10', 300.00),
(4, 102, '2026-09-02', 550.00),
(5, 102, '2026-09-07', 800.00),
(6, 103, '2026-09-03', 350.00),
(7, 103, '2026-09-12', 900.00);


# 2. LAG() to show the previous order amount for each user

SELECT
    user_id,
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
    ) AS previous_order_amount
FROM Orders
ORDER BY user_id, order_date;


# 3. LEAD() to show the next order amount for each user

SELECT
    user_id,
    order_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
    ) AS next_order_amount
FROM Orders
ORDER BY user_id, order_date;


# 4. Running total for each user

SELECT
    user_id,
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders
ORDER BY user_id, order_date;


# 5. 3-order moving average for each user

SELECT
    user_id,
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) / COUNT(*) OVER (
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM Orders
ORDER BY user_id, order_date;
