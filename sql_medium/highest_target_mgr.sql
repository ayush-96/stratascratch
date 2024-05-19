-- Find the highest target achieved by the employee or employees who works under the manager id 13. 
-- Output the first name of the employee and target achieved.
-- The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

-- Table: salesforce_employees

-- select * from salesforce_employees;

SELECT first_name, target
FROM (SELECT first_name, target, rank() OVER(PARTITION BY manager_id ORDER BY target DESC) AS rn
    FROM salesforce_employees
    WHERE manager_id = 13) s
WHERE rn = 1;
