-- Find the number of apartments per nationality that are owned by people under 30 years old.


-- Output the nationality along with the number of apartments.


-- Sort records by the apartments count in descending order.

-- Tables: airbnb_hosts, airbnb_units

-- select * from airbnb_hosts;

-- select * from airbnb_units;

SELECT h.nationality, COUNT(DISTINCT (u.unit_id)) AS apartment_count
FROM airbnb_hosts h INNER JOIN airbnb_units u
    ON h.host_id = u.host_id
WHERE h.age < 30
    AND u.unit_type = 'Apartment'
GROUP BY h.nationality
ORDER BY apartment_count DESC;
