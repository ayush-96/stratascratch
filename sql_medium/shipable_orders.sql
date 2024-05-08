-- Find the percentage of shipable orders.
-- Consider an order is shipable if the customer's address is known.

-- Tables: orders, customers


-- select * from orders;

-- select * from customers; 
-- 1 12 6 2 10 3 9 11

WITH cte_cust AS(SELECT id FROM customers where address IS NOT NULL)

SELECT COUNT(*)/(SELECT COUNT(*) FROM orders)*100 AS percent_shipable
FROM orders
WHERE cust_id IN (SELECT id FROM cte_cust);
