-- The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. 
-- Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. 
-- For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each.
-- Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie. 
-- To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

-- Table: voting_results

-- select * from voting_results;

WITH cte AS(SELECT voter, ROUND(1/COUNT(*), 3) AS vote_power
            FROM voting_results
            WHERE candidate IS NOT NULL
            GROUP BY voter)

SELECT v.candidate
FROM cte c INNER JOIN voting_results v
    ON c.voter = v.voter
GROUP BY v.candidate
ORDER BY SUM(c.vote_power) DESC
LIMIT 1;
