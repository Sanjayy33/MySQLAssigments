-- 1. Create MusicPlaylist table
CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

-- Insert 5 records
INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
(1, 'Heeriye', 'Jasleen Royal', 'Pop', 191),
(2, 'Excuses', 'AP Dhillon', 'Punjabi', 176),
(3, 'Brown Munde', 'AP Dhillon', 'Punjabi', 242),
(4, 'Kesariya', 'Arijit Singh', 'Bollywood', 268),
(5, '295', 'Sidhu Moose Wala', 'Punjabi', 295);

-- Display all columns and records
SELECT * FROM MusicPlaylist;

-- 2. Display first 3 songs
SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;

-- 3. Display unique restaurants
SELECT DISTINCT restaurant
FROM FoodOrders;

-- 4. Display food item and order date with aliases
SELECT food_item AS Dish,
       order_date AS `Date Ordered`
FROM FoodOrders;

-- 5. DISTINCT with LIMIT
SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;