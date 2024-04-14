-- Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
-- Output just the absolute difference in salaries.

-- select * from db_employee;

-- select * from db_dept;

SELECT ABS((SELECT MAX(e.salary)
FROM db_employee e INNER JOIN db_dept d
    ON e.department_id = d.id
WHERE d.department = 'engineering') - (SELECT MAX(e.salary)
FROM db_employee e INNER JOIN db_dept d
    ON e.department_id = d.id
WHERE d.department = 'marketing')) AS salary_difference
