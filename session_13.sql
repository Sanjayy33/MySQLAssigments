
CREATE DATABASE window_function_assignment;
USE window_function_assignment;

# 1. Create Playlists table and insert sample data

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists (id, user_id, playlist_name, total_likes)
VALUES
(1, 101, 'Workout Hits', 850),
(2, 101, 'Chill Vibes', 620),
(3, 101, 'Morning Music', 450),
(4, 102, 'Party Songs', 950),
(5, 102, 'Road Trip', 700),
(6, 103, 'Romantic Songs', 1200),
(7, 103, 'Old Classics', 1200),
(8, 104, 'Study Music', 500);


# 2. ROW_NUMBER() to assign a unique row number

SELECT
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (
        ORDER BY total_likes DESC
    ) AS row_number
FROM Playlists;


# 3. RANK() to rank all playlists by total likes

SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (
        ORDER BY total_likes DESC
    ) AS playlist_rank
FROM Playlists;


# 4. DENSE_RANK() to rank playlists for each user

SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS dense_rank
FROM Playlists;


# 5. Top 2 playlists for each user

WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC
        ) AS playlist_rank
    FROM Playlists
)
SELECT
    playlist_name,
    user_id,
    total_likes,
    playlist_rank
FROM RankedPlaylists
WHERE playlist_rank <= 2;
