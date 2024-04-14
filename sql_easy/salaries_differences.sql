-- https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=3

WITH cte_mar AS(SELECT emp.id as eid, emp.salary, ROW_NUMBER() OVER(PARTITION BY dep.department ORDER BY emp.salary DESC) AS rnk
            FROM db_employee emp INNER JOIN db_dept dep
                ON emp.department_id = dep.id
            WHERE dep.department = 'marketing'),
cte_eng AS(SELECT emp.id as eid, emp.salary, ROW_NUMBER() OVER(PARTITION BY dep.department ORDER BY emp.salary DESC) AS rnk
            FROM db_employee emp INNER JOIN db_dept dep
                ON emp.department_id = dep.id
            WHERE dep.department = 'engineering')
            
SELECT ABS(cte_eng.salary-(SELECT cte_mar.salary FROM cte_mar WHERE rnk = 1)) AS salary_difference
FROM cte_eng
WHERE rnk = 1;
