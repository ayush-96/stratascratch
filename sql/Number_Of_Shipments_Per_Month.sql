-- https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month?code_type=3

-- Write a query that will calculate the number of shipments per month. The unique key for one shipment is a combination of shipment_id and sub_id. Output the year_month in format YYYY-MM and the number of shipments in that month.  
-- Table: amazon_shipment

select COUNT(DISTINCT shipment_id, sub_id), CONCAT(YEAR(shipment_date), '-', MONTH(shipment_date))
from amazon_shipment
GROUP BY MONTH(shipment_date);
