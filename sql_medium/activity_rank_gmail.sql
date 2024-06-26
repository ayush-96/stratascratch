Find the email activity rank for each user. 
Email activity rank is defined by the total number of emails sent. 
The user with the highest number of emails sent will have a rank of 1, and so on. 
Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. 
For tie breaker use alphabetical order of the user usernames.

Table: google_gmail_emails

-- select * from google_gmail_emails;

SELECT from_user, COUNT(*) AS total_emails, 
    ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)
FROM google_gmail_emails
GROUP BY from_user
ORDER BY 3;
