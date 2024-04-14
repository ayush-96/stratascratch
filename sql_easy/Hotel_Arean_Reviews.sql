-- Find the number of rows for each review score earned by 'Hotel Arena'. 
-- Output the hotel name (which should be 'Hotel Arena'), 
-- review score along with the corresponding number of rows with that score for the specified hotel.

-- select * from hotel_reviews;

SELECT hotel_name,
    reviewer_score,
    COUNT(*)
FROM hotel_reviews
WHERE hotel_name = 'Hotel Arena'
GROUP BY reviewer_score;
