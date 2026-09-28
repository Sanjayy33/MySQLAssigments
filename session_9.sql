-- Create restaurants table
CREATE TABLE restaurants (
id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(100)
);

-- Create dishes table
CREATE TABLE dishes (
id INT PRIMARY KEY,
restaurant_id INT,
dish_name VARCHAR(100),
price DECIMAL(10,2)
);

-- Insert restaurants
INSERT INTO restaurants (id, name, city)
VALUES
(1, 'Swadisht Restaurant', 'Ahmedabad'),
(2, 'Food Palace', 'Surat'),
(3, 'Spice Hub', 'Vadodara');

-- Insert dishes
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Paneer Tikka', 250.00),
(2, 1, 'Masala Dosa', 150.00),
(3, 2, 'Veg Biryani', 220.00),
(4, 2, 'Manchurian', 180.00),
(5, 3, 'Pizza', 300.00),
(6, 3, 'Pasta', 250.00);

-- 2. INNER JOIN
SELECT
dishes.dish_name,
dishes.price,
restaurants.name AS restaurant_name,
restaurants.city
FROM dishes
INNER JOIN restaurants
ON dishes.restaurant_id = restaurants.id;

-- 3. LEFT JOIN
SELECT
restaurants.name AS restaurant_name,
restaurants.city,
dishes.dish_name,
dishes.price
FROM restaurants
LEFT JOIN dishes
ON restaurants.id = dishes.restaurant_id;

-- 4. Insert a dish with an invalid restaurant_id
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(7, 99, 'Unknown Dish', 200.00);

-- RIGHT JOIN
SELECT
dishes.dish_name,
dishes.price,
dishes.restaurant_id,
restaurants.name AS restaurant_name
FROM restaurants
RIGHT JOIN dishes
ON restaurants.id = dishes.restaurant_id;

-- 5. LEFT JOIN for playlists and songs
SELECT
playlists.id AS playlist_id,
playlists.name AS playlist_name,
songs.song_name
FROM playlists
LEFT JOIN songs
ON playlists.id = songs.playlist_id;
