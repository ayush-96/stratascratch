-- Find the number of Apple product users and the number of total users with a device and group the counts by language. 
-- Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. 
-- Output the language along with the total number of Apple users and users with any device. 
-- Order your results based on the number of total users in descending order.

-- Tables: playbook_events, playbook_users

-- select * from playbook_users;

-- select * from playbook_events


SELECT language, 
    SUM(case when device in ('macbook pro', 'iphone 5s', 'ipad air') then 1 else 0 end) as n_apple_use,
    COUNT(distinct user_id) as n_total_users 
FROM (SELECT DISTINCT a.user_id, device, language
            FROM playbook_events a INNER JOIN playbook_users b
            ON a.user_id = b.user_id) t
GROUP BY language order by n_total_users DESC;
