-- You're given a dataset of health inspections. 
-- Count the number of violation in an inspection in 'Roxanne Cafe' for each year. 
-- If an inspection resulted in a violation, there will be a value in the 'violation_id' column. 
-- Output the number of violations by year in ascending order.

-- Table: sf_restaurant_health_violations

-- select * from sf_restaurant_health_violations;

SELECT YEAR(inspection_date), COUNT(*) AS n_inspections
FROM sf_restaurant_health_violations s
WHERE business_name = 'Roxanne Cafe'
    AND violation_id IS NOT NULL
GROUP BY YEAR(inspection_date)
ORDER BY YEAR(inspection_date);
