-- 1. Create Restaurants table
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);

-- Insert sample restaurants
INSERT INTO Restaurants (id, name, cuisine, rating, city)
VALUES
(1, 'Swadisht', 'South Indian', 4.5, 'Ahmedabad'),
(2, 'Swagat', 'Chinese', 4.2, 'Surat'),
(3, 'Pizza House', 'Italian', 3.8, 'Ahmedabad'),
(4, 'Dragon Palace', 'Chinese', 4.6, 'Surat'),
(5, 'Food Junction', 'North Indian', 3.4, 'Vadodara');

-- Check all restaurants
SELECT * FROM Restaurants;

-- 2. Rating > 4.0 and city is Ahmedabad or Surat
SELECT *
FROM Restaurants
WHERE rating > 4.0
AND city IN ('Ahmedabad', 'Surat');

-- 3. Names starting with Swa
SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';

-- 4. Rating between 3.5 and 4.5
SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;

-- 5. Cuisine is Chinese, Italian, or South Indian
SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');