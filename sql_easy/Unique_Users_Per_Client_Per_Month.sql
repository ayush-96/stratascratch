-- https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month/submissions?code_type=3?

SELECT client_id, MONTH(time_id) as month, COUNT(DISTINCT user_id) AS user_num
FROM fact_events
GROUP BY client_id, MONTH(time_id);
