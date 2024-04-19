-- Find the review_text that received the highest number of  'cool' votes.
-- Output the business name along with the review text with the highest numbef of 'cool' votes.

-- Table: yelp_reviews

-- select * from yelp_reviews;

SELECT business_name, review_text
FROM yelp_reviews y
WHERE cool = (SELECT MAX(cool) FROM yelp_reviews);
