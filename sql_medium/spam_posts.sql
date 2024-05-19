-- Calculate the percentage of spam posts in all viewed posts by day. 
-- A post is considered a spam if a string "spam" is inside keywords of the post. 
-- Note that the facebook_posts table stores all posts posted by users. 
-- The facebook_post_views table is an action table denoting if a user has viewed a post.

-- Tables: facebook_posts, facebook_post_views

-- select * from facebook_posts;

-- select * from facebook_post_views;

WITH cte_all AS(
            SELECT p.post_date, COUNT(DISTINCT p.post_id) AS posts
            FROM facebook_posts p INNER JOIN facebook_post_views v
                ON p.post_id = v.post_id
            GROUP BY p.post_date
        ), cte_spam AS (
        SELECT p.post_date, COUNT(DISTINCT p.post_id) AS spams
        FROM facebook_posts p INNER JOIN facebook_post_views v
            ON p.post_id = v.post_id
        WHERE LOWER(p.post_keywords) REGEXP '([spam])([^a-z])'
        GROUP BY p.post_date
    )

SELECT a.post_date, (s.spams/a.posts)*100 spam_share
FROM cte_all a INNER JOIN cte_spam s
    ON a.post_date = s.post_date;
