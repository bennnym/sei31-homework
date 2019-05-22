CREATE TABLE directors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  photo TEXT
);

--seed data

INSERT INTO directors (name, age, photo) VALUES ('Quentin Tarantino', '56', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXeZ8PQbm7xm5mxOfwWAg1a-Kmvc43_U7Lh83Bls1QfprDUdNNxA')
