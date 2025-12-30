# THE ULTIMATE SQL CRASH COURSE
# Based on the curriculum of SQLBolt.com
# ------------------------------------------------------------------------------

# INTRODUCTION
# This guide covers all SQL basics using a single "Anime" database example.
# It is formatted to be copy-pasted directly into a text editor or a GitHub README.

# ------------------------------------------------------------------------------
# 0. SETUP: YOUR ANIME DATABASE
# ------------------------------------------------------------------------------
# Copy and run this block in your SQL environment (e.g., SQLite, PostgreSQL, MySQL)
# to create the tables we will use for all examples below.

CREATE TABLE Studios (
    id INTEGER PRIMARY KEY,
    name TEXT,
    country TEXT
);

CREATE TABLE Anime (
    id INTEGER PRIMARY KEY,
    title TEXT,
    studio_id INTEGER,
    genre TEXT,
    episodes INTEGER,
    rating DECIMAL(3,1),
    release_year INTEGER
);

INSERT INTO Studios (id, name, country) VALUES 
(1, 'Kyoto Animation', 'Japan'),
(2, 'Madhouse', 'Japan'),
(3, 'Studio Ghibli', 'Japan'),
(4, 'Bones', 'Japan'),
(5, 'MAPPA', 'Japan');

INSERT INTO Anime (id, title, studio_id, genre, episodes, rating, release_year) VALUES
(1, 'Violet Evergarden', 1, 'Drama', 13, 8.9, 2018),
(2, 'One Punch Man', 2, 'Action', 12, 8.8, 2015),
(3, 'Spirited Away', 3, 'Adventure', 1, 9.5, 2001),
(4, 'Fullmetal Alchemist: Brotherhood', 4, 'Adventure', 64, 9.2, 2009),
(5, 'Jujutsu Kaisen', 5, 'Action', 24, 8.7, 2020),
(6, 'A Silent Voice', 1, 'Drama', 1, 9.0, 2016),
(7, 'Death Note', 2, 'Thriller', 37, 9.0, 2006),
(8, 'Hunter x Hunter', 2, 'Adventure', 148, 9.1, 2011),
(9, 'My Neighbor Totoro', 3, 'Fantasy', 1, 8.6, 1988),
(10, 'Mob Psycho 100', 4, 'Action', 12, 8.6, 2016),
(11, 'My Hero Academia', 4, 'Action', 13, 8.0, 2016),
(12, 'Chainsaw Man', 5, 'Action', 12, 8.5, 2022),
(13, 'Attack on Titan Final Season', 5, 'Action', 16, 8.9, 2020),
(14, 'K-On!', 1, 'Slice of Life', 13, 7.8, 2009),
(15, 'Hyouka', 1, 'Mystery', 22, 8.1, 2012),
(16, 'Paprika', 2, 'Sci-Fi', 1, 8.1, 2006),
(17, 'Howls Moving Castle', 3, 'Adventure', 1, 8.7, 2004),
(18, 'Noragami', 4, 'Action', 12, 8.0, 2014),
(19, 'Cowboy Bebop', NULL, 'Sci-Fi', 26, 8.9, 1998),
(20, 'Akira', NULL, 'Sci-Fi', 1, 8.0, 1988);


# ------------------------------------------------------------------------------
# LESSON 1: SELECT QUERIES 101
# ------------------------------------------------------------------------------
# THEORY:
# To fetch data, use the SELECT statement. You specify columns to retrieve and
# the table to get them from. Use `*` to select ALL columns.

# SYNTAX:
# SELECT column1, column2 FROM table_name;

# EXAMPLE:
# Get the names and genres of all anime.
SELECT title, genre FROM Anime;

# EXAMPLE:
# Get absolutely everything about every anime.
SELECT * FROM Anime;


# ------------------------------------------------------------------------------
# LESSON 2: CONSTRAINTS (WHERE CLAUSE) - NUMBERS
# ------------------------------------------------------------------------------
# THEORY:
# Use the WHERE clause to filter results. The database checks each row against
# your condition. If it's true, the row is returned.
# Operators: =, != (not equal), <, >, <=, >=

# SYNTAX:
# SELECT * FROM table_name WHERE condition;

# EXAMPLE:
# Find all anime with a rating higher than 9.0.
SELECT * FROM Anime WHERE rating > 9.0;

# EXAMPLE:
# Find all anime released exactly in 2016.
SELECT * FROM Anime WHERE release_year = 2016;


# ------------------------------------------------------------------------------
# LESSON 3: CONSTRAINTS (WHERE CLAUSE) - TEXT
# ------------------------------------------------------------------------------
# THEORY:
# For text, use single quotes ('Text').
# - `=` is for exact matches.
# - `LIKE` is for patterns.
# - `%` matches any sequence of characters (wildcard).
# - `_` matches exactly one character.
# - `IN` matches a list of values.

# SYNTAX:
# SELECT * FROM table WHERE column LIKE 'Pattern%';

# EXAMPLE:
# Find anime where the genre is EXACTLY 'Action'.
SELECT * FROM Anime WHERE genre = 'Action';

# EXAMPLE:
# Find anime starting with "My" (e.g., My Hero Academia, My Neighbor Totoro).
SELECT * FROM Anime WHERE title LIKE 'My%';

# EXAMPLE:
# Find anime that are either Drama or Mystery.
SELECT * FROM Anime WHERE genre IN ('Drama', 'Mystery');


# ------------------------------------------------------------------------------
# LESSON 4: FILTERING AND SORTING
# ------------------------------------------------------------------------------
# THEORY:
# - DISTINCT: Removes duplicate rows from the result.
# - ORDER BY: Sorts results (ASC for ascending, DESC for descending).
# - LIMIT: Takes only the first N rows.
# - OFFSET: Skips the first N rows.

# SYNTAX:
# SELECT DISTINCT column FROM table ORDER BY column DESC LIMIT 5;

# EXAMPLE:
# List all unique genres in the database.
SELECT DISTINCT genre FROM Anime;

# EXAMPLE:
# Top 3 highest-rated anime.
SELECT * FROM Anime ORDER BY rating DESC LIMIT 3;


# ------------------------------------------------------------------------------
# LESSON 5: REVIEW (SIMPLE SELECTS)
# ------------------------------------------------------------------------------
# (No new theory, just practice combining previous lessons)

# EXAMPLE:
# Find the top 2 'Action' anime sorted by release year (newest first).
SELECT title, release_year FROM Anime 
WHERE genre = 'Action' 
ORDER BY release_year DESC 
LIMIT 2;


# ------------------------------------------------------------------------------
# LESSON 6: MULTI-TABLE QUERIES (INNER JOIN)
# ------------------------------------------------------------------------------
# THEORY:
# Real data is often split across tables (Normalization).
# JOIN connects tables using a common key (usually an ID).
# INNER JOIN only returns rows where there is a match in BOTH tables.

# SYNTAX:
# SELECT * FROM TableA 
# INNER JOIN TableB ON TableA.id = TableB.a_id;

# EXAMPLE:
# List anime titles along with their Studio Name.
# (Connects Anime.studio_id to Studios.id)
SELECT Anime.title, Studios.name 
FROM Anime 
INNER JOIN Studios ON Anime.studio_id = Studios.id;


# ------------------------------------------------------------------------------
# LESSON 7: OUTER JOINS (LEFT JOIN)
# ------------------------------------------------------------------------------
# THEORY:
# INNER JOIN discards rows with no match.
# LEFT JOIN keeps everything from the "Left" table (first one mentioned),
# filling missing data from the "Right" table with NULL.

# SYNTAX:
# SELECT * FROM TableA LEFT JOIN TableB ON ...

# EXAMPLE:
# List ALL anime and their studio, even if the studio is unknown (NULL).
# Note: 'Cowboy Bebop' and 'Akira' will show up here, but would vanish in an INNER JOIN.
SELECT Anime.title, Studios.name 
FROM Anime 
LEFT JOIN Studios ON Anime.studio_id = Studios.id;


# ------------------------------------------------------------------------------
# LESSON 8: NULLS
# ------------------------------------------------------------------------------
# THEORY:
# NULL means "missing value". You cannot use `=` to check for NULL.
# You must use `IS NULL` or `IS NOT NULL`.

# SYNTAX:
# SELECT * FROM table WHERE column IS NULL;

# EXAMPLE:
# Find anime that do not have a studio assigned.
SELECT title FROM Anime WHERE studio_id IS NULL;


# ------------------------------------------------------------------------------
# LESSON 9: EXPRESSIONS
# ------------------------------------------------------------------------------
# THEORY:
# You can do math or string operations directly in the query.
# Use `AS` to rename the resulting column (Aliasing).

# SYNTAX:
# SELECT (column * 100) AS new_name FROM table;

# EXAMPLE:
# Estimate total duration of an anime (episodes * 24 mins) and call it 'total_minutes'.
SELECT title, (episodes * 24) AS total_minutes FROM Anime;


# ------------------------------------------------------------------------------
# LESSON 10: AGGREGATES (COUNT, SUM, AVG, MAX)
# ------------------------------------------------------------------------------
# THEORY:
# Aggregate functions perform calculations on a set of rows and return a single value.
# - COUNT(*): Counts rows.
# - MAX(col): Finds highest value.
# - AVG(col): Finds average.
# - GROUP BY: Groups rows sharing a property so aggregates apply to each group.

# SYNTAX:
# SELECT category, COUNT(*) FROM table GROUP BY category;

# EXAMPLE:
# Count how many anime exist in the database.
SELECT COUNT(*) FROM Anime;

# EXAMPLE:
# Count how many anime belong to each Genre.
SELECT genre, COUNT(*) FROM Anime GROUP BY genre;


# ------------------------------------------------------------------------------
# LESSON 11: AGGREGATES WITH FILTERS (HAVING)
# ------------------------------------------------------------------------------
# THEORY:
# `WHERE` filters rows *before* grouping.
# `HAVING` filters groups *after* grouping.
# If you want to filter based on the result of an aggregate (like count), use HAVING.

# SYNTAX:
# SELECT col, COUNT(*) FROM table GROUP BY col HAVING COUNT(*) > 5;

# EXAMPLE:
# Find genres that have more than 2 anime listed in our database.
SELECT genre, COUNT(*) as count 
FROM Anime 
GROUP BY genre 
HAVING count > 2;


# ------------------------------------------------------------------------------
# LESSON 12: ORDER OF EXECUTION (THEORY ONLY)
# ------------------------------------------------------------------------------
# THEORY:
# SQL is not read top-to-bottom by the computer. It follows this specific order:
# 1. FROM & JOINs (Determine the data source)
# 2. WHERE (Filter raw rows)
# 3. GROUP BY (Aggregate rows)
# 4. HAVING (Filter grouped rows)
# 5. SELECT (Choose columns/expressions)
# 6. DISTINCT (Remove duplicates)
# 7. ORDER BY (Sort)
# 8. LIMIT / OFFSET (Slice)


# ------------------------------------------------------------------------------
# LESSON 13: INSERTING ROWS
# ------------------------------------------------------------------------------
# THEORY:
# Add new data using INSERT INTO. You must match the column order or specify columns.

# SYNTAX:
# INSERT INTO table (col1, col2) VALUES (val1, val2);

# EXAMPLE:
# Add a new anime 'Demon Slayer'.
INSERT INTO Anime (title, genre, episodes, rating, release_year) 
VALUES ('Demon Slayer', 'Action', 26, 8.7, 2019);


# ------------------------------------------------------------------------------
# LESSON 14: UPDATING ROWS
# ------------------------------------------------------------------------------
# THEORY:
# Modify existing data. ALWAYS use a WHERE clause, or you will update every row!

# SYNTAX:
# UPDATE table SET column = new_value WHERE condition;

# EXAMPLE:
# 'Demon Slayer' rating went up. Update it to 9.0.
UPDATE Anime SET rating = 9.0 WHERE title = 'Demon Slayer';


# ------------------------------------------------------------------------------
# LESSON 15: DELETING ROWS
# ------------------------------------------------------------------------------
# THEORY:
# Remove data. Like Update, ALWAYS use WHERE or you wipe the table.

# SYNTAX:
# DELETE FROM table WHERE condition;

# EXAMPLE:
# Delete 'Demon Slayer' from the database.
DELETE FROM Anime WHERE title = 'Demon Slayer';


# ------------------------------------------------------------------------------
# LESSON 16, 17, 18: CREATING, ALTERING, & DROPPING TABLES
# ------------------------------------------------------------------------------
# THEORY:
# - CREATE TABLE: Defines a new table structure.
# - ALTER TABLE: Adds or removes columns.
# - DROP TABLE: Deletes the table and all its data permanently.

# SYNTAX:
# CREATE TABLE Name (col Type Constraints);
# ALTER TABLE Name ADD column Type;
# DROP TABLE Name;

# EXAMPLE:
# Create a simple Review table.
CREATE TABLE Reviews (
    id INTEGER PRIMARY KEY,
    anime_id INTEGER,
    comment TEXT
);

# EXAMPLE:
# Add a 'user_name' column to Reviews.
ALTER TABLE Reviews ADD column user_name TEXT;

# EXAMPLE:
# Delete the Reviews table entirely.
DROP TABLE Reviews;

# ------------------------------------------------------------------------------
# END OF GUIDE
# ------------------------------------------------------------------------------
