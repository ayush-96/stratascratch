-- Count the number of movies that Abigail Breslin was nominated for an oscar.

-- select * from oscar_nominees;

SELECT COUNT(*) AS n_movies_by_abi
FROM oscar_nominees
WHERE nominee = UPPER('ABIGAIL BRESLIN');
