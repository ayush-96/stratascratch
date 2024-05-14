-- What were the top 10 ranked songs in 2010?
-- Output the rank, group name, and song name but do not show the same song twice.
-- Sort the result based on the year_rank in ascending order.

-- Table: billboard_top_100_year_end

-- select * from billboard_top_100_year_end;

SELECT DISTINCT song_name, group_name, year_rank
FROM billboard_top_100_year_end
WHERE year = '2010'
ORDER BY year_rank
LIMIT 10;
