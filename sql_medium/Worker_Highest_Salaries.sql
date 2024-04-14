-- You have been asked to find the job titles of the highest-paid employees.
-- Your output should include the highest-paid title or multiple titles with the same salary.

-- select * from worker;

SELECT t.worker_title AS best_paid_title
FROM worker w INNER JOIN title t
    ON w.worker_id = t.worker_ref_id
WHERE w.salary = (SELECT MAX(salary)
                FROM worker);
