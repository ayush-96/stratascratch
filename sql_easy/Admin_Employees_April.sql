-- Find the number of employees working in the Admin department that joined in April or later.

-- select * from worker;

SELECT COUNT(*) AS n_admins
FROM worker
WHERE joining_date >= '2014-04-01'
    AND department = 'Admin';
