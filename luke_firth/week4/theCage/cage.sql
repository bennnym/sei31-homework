CREATE TABLE cage (
id INTEGER PRIMARY KEY AUTOINCREMENT,
movie TEXT,
terrible_scene INTEGER
);

INSERT INTO cage (movie) VALUES ('The Family Man');

--sqlite3 database.sqlite3 < cage.sql
