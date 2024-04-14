-- Find how many times each artist appeared on the Spotify ranking list
-- Output the artist name along with the corresponding number of occurrences.
-- Order records by the number of occurrences in descending order.

-- select * from spotify_worldwide_daily_song_ranking;

SELECT artist, COUNT(*) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY COUNT(*) DESC;
