-- Make a report showing the number of survivors and non-survivors by passenger class.
-- Classes are categorized based on the pclass value as:
-- pclass = 1: first_class
-- pclass = 2: second_classs
-- pclass = 3: third_class
-- Output the number of survivors and non-survivors by each class.

-- Table: titanic

-- select * from titanic;

SELECT survived, 
        SUM(IF(pclass = 1, 1, NULL)) AS first_class,
        SUM(IF(pclass = 2, 1, NULL)) AS second_class,
        SUM(IF(pclass = 3, 1, NULL)) AS third_class
FROM titanic
GROUP BY survived;
