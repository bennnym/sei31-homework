CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  year INTEGER,
  image TEXT
);

--seed data

INSERT INTO movies (name, year, image) VALUES ('Pulp Fiction', '1994', 'https://is3-ssl.mzstatic.com/image/thumb/Video1/v4/3f/06/4b/3f064b52-e3d4-7207-39d0-14c8fbf03cd4/pr_source.lsr/268x0w.png')
