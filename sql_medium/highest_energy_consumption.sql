-- Find the date with the highest total energy consumption from the Meta/Facebook data centers. 
-- Output the date along with the total energy consumption across all data centers.

-- Tables: fb_eu_energy, fb_asia_energy, fb_na_energy

-- select * from fb_eu_energy;

-- select * from fb_asia_energy;

-- select * from fb_na_energy;

WITH cte AS(
    SELECT date, consumption FROM fb_eu_energy
    UNION
    SELECT date, consumption FROM fb_asia_energy
    UNION
    SELECT date, consumption FROM fb_na_energy
), cte2 AS(SELECT date, SUM(consumption) AS consumption
    FROM cte
    GROUP BY date)

SELECT date, consumption
FROM cte2
WHERE consumption = (SELECT MAX(consumption) AS consumption
                    FROM cte2)
