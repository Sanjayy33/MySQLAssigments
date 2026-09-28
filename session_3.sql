-- 1. Create Playlist table
CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

-- Insert current favorite song
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (1, 'Heeriye', 'Jasleen Royal', 191);

-- 2. Insert 3 more songs
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES
(2, 'Excuses', 'AP Dhillon', 176),
(3, 'Brown Munde', 'AP Dhillon', 242),
(4, 'Kesariya', 'Arijit Singh', 268);

-- Check all songs
SELECT * FROM Playlist;

-- 3. Fix artist typo
UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE artist = 'Arjit Singh';

-- 4. Delete songs shorter than 120 seconds
DELETE FROM Playlist
WHERE duration < 120;

-- 5. Add (Remix) to AP Dhillon songs longer than 180 seconds
UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
AND duration > 180;

-- Final result
SELECT * FROM Playlist;