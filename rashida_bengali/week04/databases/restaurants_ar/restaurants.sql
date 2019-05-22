CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  location TEXT,
  image TEXT
);

-- seed
INSERT INTO restaurants (name, location) VALUES ('Pappa Rich', 'Bankstown');
