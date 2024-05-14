-- Find employees who are earning more than their managers. 
-- Output the employee's first name along with the corresponding salary.

-- Table: employee

-- select * from employee;

SELECT e.first_name, e.salary AS employee_salary
FROM employee e INNER JOIN employee m
    ON e.manager_id = m.id
WHERE e.salary > m.salary
