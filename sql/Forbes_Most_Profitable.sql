-- select * from forbes_global_2010_2014;
-- Find the most profitable company from the financial sector. Output the result along with the continent.


SELECT company, continent
FROM forbes_global_2010_2014
WHERE `rank` = 1;
