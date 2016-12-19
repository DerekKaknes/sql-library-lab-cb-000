def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books LEFT JOIN series
  ON books.series_id = series.id
  WHERE series.id = (SELECT id FROM series LIMIT 1)
  ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) as population
  FROM characters
  GROUP BY species
  ORDER BY population DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, author_series.name
  FROM authors LEFT JOIN (
    SELECT series.author_id, subgenres.name
    FROM series LEFT JOIN subgenres
    ON series.subgenre_id = subgenres.id
  ) as author_series
  ON authors.id = author_series.author_id
  ;"
end

def select_series_title_with_most_human_characters
  # series.title <- character.series_id <- character.species
  "SELECT title
  FROM series LEFT JOIN characters
  ON series.id = characters.series_id
  WHERE species = 'human'
  GROUP BY title
  ORDER BY COUNT(species) DESC
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  # join characters and (books <- series)
  "SELECT characters.name, COUNT(characters.name) as appearances
  FROM characters LEFT JOIN (
    SELECT *
    FROM character_books LEFT JOIN books
    ON character_books.book_id = books.id
  ) as books
  ON characters.id = books.character_id
  GROUP BY characters.name
  ORDER BY appearances DESC, characters.name
  ;"
end
