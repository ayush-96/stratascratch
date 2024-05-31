Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.


For simplicity, you can assume that every first name in the dataset is unique.

Tables: customers, orders

-- select * from customers;

-- select * from orders;

SELECT c.first_name, o.order_date, SUM(o.total_order_cost) AS total_cost
FROM customers c INNER JOIN orders o
    ON c.id = o.cust_id
WHERE o.order_date >= '2019-02-01' AND order_date <= '2019-05-01'
GROUP BY c.id, o.order_date
ORDER BY total_cost DESC LIMIT 1;
