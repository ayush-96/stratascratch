-- Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
-- Output all details related to retrieved records.

-- select * from lyft_drivers;

-- SET @low := 30000;
-- SET @high := 70000;

SELECT `index`,
    start_date,
    end_date,
    yearly_salary
FROM lyft_drivers
WHERE yearly_salary <= 30000
    OR yearly_salary >= 70000;
