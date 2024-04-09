-- https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=3

-- You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
-- Output their IDs and the total revenue.
-- Table: online_orders

-- SELECT * FROM online_orders;

SELECT product_id, SUM(cost_in_dollars * units_sold) AS revenue
FROM online_orders
WHERE date >= '2022-01-01' AND date <= '2022-06-30'
GROUP BY product_id
ORDER BY 2 DESC
LIMIT 5;
