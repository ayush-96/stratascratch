You're given a dataset of searches for properties on Airbnb. For simplicity, let's say that each search result (i.e., each row) represents a unique host. 
Find the city with the most amenities across all their host's properties. Output the name of the city.

Table: airbnb_search_details

-- select * from airbnb_search_details;

WITH cte AS(SELECT amenities,
        LENGTH(amenities)-LENGTH(REPLACE(amenities, ',', '')) AS amenities_count,
        city
    FROM airbnb_search_details)

SELECT city
FROM cte
GROUP BY city
ORDER BY SUM(amenities_count) DESC
LIMIT 1;
-- skipping the multiple rows having max - window func, cte, subquery, etc. 
