  CREATE TABLE actors (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   firstName TEXT,
   lastName TEXT,
   image TEXT
  );

    --seed data
    INSERT INTO actors (firstName, lastName) VALUES ("Nicholas", "Cage");
    --sqlite3 database.sqlite3 < actors.sql
