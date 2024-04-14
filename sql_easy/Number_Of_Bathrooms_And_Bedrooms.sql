-- https://platform.stratascratch.com/coding/9622-number-of-bathrooms-and-bedrooms?code_type=3

-- Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.
-- Table: airbnb_search_details

-- select * from airbnb_search_details;

SELECT city, property_type, AVG(bathrooms), AVG(bedrooms)
FROM airbnb_search_details
GROUP BY city, property_type;
