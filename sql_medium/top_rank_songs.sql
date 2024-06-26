-- Find songs that have ranked in the top position. 
-- Output the track name and the number of times it ranked at the top. 
-- Sort your records by the number of times the song was in the top position in descending order.

-- Table: spotify_worldwide_daily_song_ranking

-- select * from spotify_worldwide_daily_song_ranking;

SELECT trackname, COUNT(*) AS times_top1
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER by times_top1 DESC;
