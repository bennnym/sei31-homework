CREATE TABLE moods (
id INTEGER PRIMARY KEY AUTOINCREMENT,
mood TEXT,
image TEXT
);

--seed data
INSERT INTO moods (mood) VALUES ('sad')

--sqlite3 database.sqlite3 < moods.sql
