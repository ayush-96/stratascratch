You are given a table of product launches by company by year. 
Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.

Table: car_launches

-- select * from car_launches;

SELECT company_name, 2020_launch-2019_launch AS total_launch
FROM (SELECT company_name, SUM(CASE WHEN year = '2019' THEN 1 ELSE 0 END) AS 2019_launch,
        SUM(CASE WHEN year = '2020' THEN 1 ELSE 0 END) AS 2020_launch
    FROM car_launches
    GROUP BY company_name) t
