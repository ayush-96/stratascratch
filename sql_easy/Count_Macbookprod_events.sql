-- Count the number of user events performed by MacBookPro users.
-- Output the result along with the event name.
-- Sort the result based on the event count in the descending order.
-- select * from playbook_events;

SELECt event_name, count(*)
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY 1
ORDER BY 2 DESC;
