-- Create the database
CREATE DATABASE foodie_app;

-- Select the database
USE foodie_app;

-- Create restaurants table
CREATE TABLE restaurants (
id INT PRIMARY KEY,
name VARCHAR(100),
cuisine VARCHAR(50),
rating DECIMAL(2,1),
location VARCHAR(100)
);

-- Create users table
CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(100) UNIQUE,
email VARCHAR(255) UNIQUE,
phone_number VARCHAR(15) UNIQUE,
created_at DATETIME
);

-- Check the tables
SHOW TABLES;

-- Display table structures
DESC restaurants;
DESC users;
