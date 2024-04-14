-- Find the base pay for Police Captains.
-- Output the employee name along with the corresponding base pay.

-- select * from sf_public_salaries;

SELECT employeename,
    basepay
FROM sf_public_salaries
WHERE jobtitle = 'CAPTAIN III (POLICE DEPARTMENT)';
