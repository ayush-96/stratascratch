-- Find the Olympics with the highest number of athletes. 
-- The Olympics game is a combination of the year and the season, and is found in the 'games' column. 
-- Output the Olympics along with the corresponding number of athletes.

-- Table: olympics_athletes_events

-- select * from olympics_athletes_events;

SELECT games, COUNT(DISTINCT name) as athletes_count
FROM olympics_athletes_events
GROUP BY games
ORDER BY athletes_count DESC
LIMIT 1;
