-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

-- Table: employee

-- select * from employee;

SELECT s.department, s.employee_name, s.salary
FROM (SELECT department, 
        first_name AS employee_name, 
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS rn,
        salary
    FROM employee) s
WHERE s.rn = 1;
