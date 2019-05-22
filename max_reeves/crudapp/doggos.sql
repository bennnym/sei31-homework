CREATE TABLE doggos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  treats TEXT,
  image TEXT
);

-- seed
INSERT INTO doggos (name, treats) VALUES ('Beagle', 'Salami');
