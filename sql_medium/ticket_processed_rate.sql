Find the rate of processed tickets for each type.

Table: facebook_complaints

-- select * from facebook_complaints;

WITH cte AS(SELECT type, 
                SUM(CASE WHEN processed = 1 THEN 1 ELSE 0 END) AS success, 
                COUNT(*) AS total
            FROM facebook_complaints
            GROUP BY type)

SELECT type, ROUND(success/total, 3) AS processed_rate
FROM cte;
