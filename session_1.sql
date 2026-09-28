CREATE DATABASE music_streaming_app;

USE music_streaming_app;

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100),
    created_by VARCHAR(100)
);

INSERT INTO playlists (playlist_id, name, created_by)
VALUES
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Rahul'),
(3, 'Workout Mix', 'Priya');

SELECT *
FROM playlists
WHERE created_by = 'Amit';