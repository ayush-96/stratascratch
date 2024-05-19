Find the second highest salary of employees.

Table: employee

-- select * from employee;

-- SELECT salary
-- FROM (SELECT salary, rank() OVER(ORDER BY salary DESC) AS rnk
--     FROM employee) s
-- WHERE rnk = 2;

SELECT MAX(salary) AS salary
FROM employee
WHERE salary < (SELECT MAX(salary) as mx FROM employee);
