DROP TABLE IF EXISTS series;
CREATE TABLE series (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT,
  author_id INTEGER,
  sub_genre_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (sub_genre_id) REFERENCES sub_genres(id)
);

CREATE TABLE characters (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  motto TEXT,
  species TEXT,
  author_id INTEGER,
  series_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
);

CREATE TABLE books (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT,
  year INTEGER,
  series_id INTEGER,
  FOREIGN KEY (series_id) REFERENCES series(id)
);

CREATE TABLE authors (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT
);

CREATE TABLE sub_genres (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT
);
