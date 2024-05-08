-- Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
-- Output the revenue along with the customer id and sort the results based on the revenue in descending order.

-- Table: orders

-- select * from orders;

SELECT cust_id, SUM(total_order_cost) AS revenue
FROM orders
WHERE YEAR(order_date) = '2019' AND MONTH(order_date)  = '03'
GROUP BY cust_id
ORDER BY revenue DESC;
