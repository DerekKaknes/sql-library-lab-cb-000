DROP TABLE IF EXISTS series;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS subgenres;
DROP TABLE IF EXISTS character_books;

CREATE TABLE series (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT,
  author_id INTEGER,
  subgenre_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (subgenre_id) REFERENCES subgenres(id)
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

CREATE TABLE subgenres (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT
);

CREATE TABLE character_books (
  id INTEGER NOT NULL PRIMARY KEY,
  character_id INTEGER,
  book_id INTEGER,
  FOREIGN KEY (character_id) REFERENCES characters(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);
