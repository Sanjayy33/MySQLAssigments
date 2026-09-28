
# 1. Create foodie.db and Restaurants table

import sqlite3

conn = sqlite3.connect("foodie.db")

cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT,
    cuisine TEXT,
    rating REAL
)
""")

conn.commit()
conn.close()


# 2. Insert three restaurants and fetch restaurants with rating above 4.0

import sqlite3

conn = sqlite3.connect("foodie.db")

cursor = conn.cursor()

restaurants = [
    (1, "La Bella", "Italian", 4.5),
    (2, "Spice Garden", "Indian", 4.2),
    (3, "Dragon House", "Chinese", 3.9)
]

cursor.executemany("""
INSERT OR IGNORE INTO Restaurants
(id, name, cuisine, rating)
VALUES (?, ?, ?, ?)
""", restaurants)

conn.commit()

cursor.execute("""
SELECT name
FROM Restaurants
WHERE rating > 4.0
""")

restaurants = cursor.fetchall()

for restaurant in restaurants:
    print(restaurant[0])

conn.close()


# 3. Load all restaurants into a Pandas DataFrame

import sqlite3
import pandas as pd

conn = sqlite3.connect("foodie.db")

df = pd.read_sql_query("""
SELECT *
FROM Restaurants
""", conn)

print(df.head(2))

conn.close()


# 4. Add delivery_charge and calculate final_rating

df["delivery_charge"] = 50

df["final_rating"] = df.apply(
    lambda row: row["rating"] + 0.1
    if row["cuisine"] == "Italian"
    else row["rating"],
    axis=1
)

print(df)


# 5. Fetch top-rated restaurants and save them as CSV

import sqlite3
import pandas as pd

conn = sqlite3.connect("foodie.db")

df = pd.read_sql_query("""
SELECT *
FROM Restaurants
WHERE rating > 4.5
""", conn)

df.to_csv("top_rated_restaurants.csv", index=False)

conn.close()

print("Top-rated restaurants saved to top_rated_restaurants.csv")