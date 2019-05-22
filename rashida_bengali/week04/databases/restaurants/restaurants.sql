CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  cuisine TEXT,
  location TEXT,
  image TEXT
);

-- seed
INSERT INTO restaurants (name, cuisine) VALUES ('Pappa Rich', 'Malaysian');
