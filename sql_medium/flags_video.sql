-- For each video, find how many unique users flagged it. 
-- A unique user can be identified using the combination of their first name and last name. 
-- Do not consider rows in which there is no flag ID.

-- Table: user_flags

-- select * from user_flags;

SELECT COUNT(DISTINCT(concat(IFNULL(user_firstname, ''), IFNULL(user_lastname, '')))) AS username, video_id
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id;
