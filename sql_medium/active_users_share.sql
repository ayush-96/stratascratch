-- Output share of US users that are active. Active users are the ones with an "open" status in the table.

-- Table: fb_active_users

-- select * from fb_active_users;

SELECT SUM(CASE WHEN status = 'open' THEN 1 ELSE 0 END)/
    COUNT(*) AS active_users_share
FROM fb_active_users
WHERE country = 'USA'
