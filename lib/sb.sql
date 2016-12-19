.read 'lib/schema.sql'
.read 'lib/insert.sql'
.headers ON

-- SELECT characters.name, COUNT(characters.name) as appearances
-- FROM characters LEFT JOIN
--   (SELECT series.id, series.title as series_name, books.title
--   FROM books LEFT JOIN series
--   ON books.series_id = series.id) as book_series
-- ON characters.series_id = book_series.id
-- GROUP BY characters.name
-- ORDER BY appearances DESC, characters.name
-- ;

-- SELECT series.id, series.title as series_name, books.title
-- FROM books LEFT JOIN series
-- ON books.series_id = series.id;

SELECT characters.name, COUNT(characters.name) as appearances
FROM characters LEFT JOIN (
  SELECT *
  FROM character_books LEFT JOIN books
  ON character_books.book_id = books.id
) as books
ON characters.id = books.character_id
GROUP BY characters.name
ORDER BY appearances DESC, characters.name
;
