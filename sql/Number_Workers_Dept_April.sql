-- select * from worker;

-- Find the number of workers by department who joined in or after April.
-- Output the department name along with the corresponding number of workers.
-- Sort records based on the number of workers in descending order.

SELECT department, COUNT(*) AS num_workers
FROM worker
WHERE joining_date >= '2014-04-01'
GROUP BY 1
ORDER BY 2 DESC;
