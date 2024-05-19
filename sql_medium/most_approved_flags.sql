-- Which user flagged the most distinct videos that ended up approved by YouTube? 
-- Output, in one column, their full name or names in case of a tie. 
-- In the user's full name, include a space between the first and the last name.

-- Tables: user_flags, flag_review

-- select * from user_flags;

-- select * from flag_review;

WITH cte AS(SELECT DISTINCT CONCAT(user_firstname, ' ', user_lastname) AS username, f.video_id
            FROM user_flags f INNER JOIN flag_review r
                ON f.flag_id = r.flag_id
            WHERE r.reviewed_by_yt IS TRUE 
            AND r.reviewed_outcome = 'APPROVED')

SELECT username
FROM cte 
GROUP BY 1
HAVING COUNT(*) = (SELECT COUNT(*) AS flag_count
                    FROM cte
                GROUP BY username ORDER BY flag_count DESC LIMIT 1);
