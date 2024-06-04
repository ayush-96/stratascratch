Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
Output a list of user_ids of these returning active users.

Table: amazon_transactions

-- select * from amazon_transactions;

WITH cte AS(
    SELECT user_id, created_at, LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS nxt_purchase
    FROM amazon_transactions
), cte2 AS(
    SELECT user_id, DATEDIFF(created_at, nxt_purchase) AS next_date
    FROM cte
)

SELECT DISTINCT user_id
FROM cte2
WHERE next_date <= 7;


