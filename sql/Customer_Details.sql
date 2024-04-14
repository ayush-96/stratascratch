-- Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
-- Sort records based on the customer's first name and the order details in ascending order.

-- select * from customers;

SELECT c.first_name, 
    c.last_name, 
    c.city,
    o.order_details
FROM customers c LEFT JOIN orders o
    ON c.id = o.cust_id
ORDER BY c.first_name, o.order_details;
