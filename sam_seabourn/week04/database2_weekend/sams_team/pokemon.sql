CREATE TABLE pokemons (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  nickname TEXT,
  type1 TEXT,
  type2 TEXT,
  image TEXT
);


--Seed data
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Lugia","Lewges","Flying","Psychic","https://img.pokemondb.net/artwork/large/lugia.jpg");
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Rayquaza","RayJay","Flying","Dragon","https://img.pokemondb.net/artwork/large/rayquaza.jpg");
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Snorlax","Mawrlax","Normal","Normal","https://img.pokemondb.net/artwork/large/snorlax.jpg");
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Mewtwo","Mewtwo","Psychic","Psychic","https://img.pokemondb.net/artwork/large/mewtwo.jpg");
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Metagross","Gary","Steel","Psychic","https://img.pokemondb.net/artwork/large/metagross.jpg");
INSERT INTO pokemons (name,nickname,type1,type2,image) VALUES ("Aerodactyl","Skuxbird","Flying","Rock","https://img.pokemondb.net/artwork/large/aerodactyl.jpg");
