-- Identify projects that are at risk for going overbudget. 
-- A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project.


-- You'll need to prorate the cost of the employees to the duration of the project. 
-- For example, if the budget for a project that takes half a year to complete is $10K, then the total half-year salary of all employees assigned to the project should not exceed $10K. 
-- Salary is defined on a yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.


-- Output a list of projects that are overbudget with their project name, project budget, and prorated total employee expense (rounded to the next dollar amount).

-- HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.

-- Tables: linkedin_projects, linkedin_emp_projects, linkedin_employees

-- select * from linkedin_projects;

-- select * from linkedin_emp_projects;

-- select * from linkedin_employees;

WITH cte AS(SELECT e.id, (e.salary/365) AS daily_wage, ep.project_id
            FROM linkedin_employees e INNER JOIN linkedin_emp_projects ep
                ON e.id = ep.emp_id)

SELECT p.title, 
    p.budget,
    CEIL(SUM((c.daily_wage * DATEDIFF(p.end_date, start_date)))) AS prorated_employee_expense
FROM cte c INNER JOIN linkedin_projects p
    ON c.project_id = p.id
GROUP BY p.title
HAVING p.budget < prorated_employee_expense
