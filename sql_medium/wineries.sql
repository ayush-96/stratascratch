-- Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. 
-- To make it more simple, look only for singular form of the mentioned aromas. 
-- HINT: if one of the specified words is just a substring of another word, this should not be a hit, but a miss.


-- Example Description: Hot, tannic and simple, with cherry jam and currant flavors accompanied by high,
-- tart acidity and chile-pepper alcohol heat.
-- Therefore the winery Bella Piazza is expected in the results.

-- Table: winemag_p1

-- select * from winemag_p1;

select distinct winery
FROM winemag_p1
where lower(description) REGEXP '(plum|rose|cherry|hazelnut)([^a-z])';

-- REGEXP '(plum|rose|cherry|hazelnut)([^a-z])': This is a regular expression pattern used for matching text in the "description" column. 
-- Here's what it does:
-- (plum|rose|cherry|hazelnut): This part of the pattern specifies a group of words separated by the "|" (pipe) character.
-- It matches any description that contains any of the specified words: "plum", "rose", "cherry", or "hazelnut".
-- ([^a-z]): This part of the pattern specifies a negative character class that matches any character that is not a lowercase letter.
-- It ensures that the word boundaries are included in the match,
-- so the pattern doesn't match words that contain the specified keywords as substrings (e.g., "plump" or "rosemary").

-- Word boundaries in regular expressions are special characters or sequences that indicate the beginning or end of a word. 
-- They allow you to match patterns only at specific positions within words, rather than anywhere within the text.
