-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

-- select * from facebook_reactions;

SELECT DISTINCT p.post_id, p.poster, p.post_text, p.post_keywords, p.post_date
FROM facebook_reactions r INNER JOIN facebook_posts p
    ON r.post_id = p.post_id
WHERE r.reaction = 'heart';
