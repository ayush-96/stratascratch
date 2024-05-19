-- Find the number of times each word appears in drafts.
-- Output the word along with the corresponding number of occurrences.

-- Table: google_file_store

-- select * from google_file_store;

-- The provided SQL query aims to count the occurrence of each word in files that have 'draft' in their filenames. 
-- The logic involves splitting text data, recursive CTEs for iterating through words, 
-- and aggregation to count each word's appearances.


WITH RECURSIVE 
cte_split AS(
    SELECT 1 AS whitespaces
    UNION ALL
    SELECT whitespaces+1
    FROM cte_split
    WHERE whitespaces <= (SELECT MAX(LENGTH(contents)-LENGTH(REPLACE(contents, ' ', '')))
    FROM google_file_store WHERE filename LIKE 'draft%'))

SELECT TRIM(',' FROM
        TRIM('.' FROM 
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(contents, ' ', whitespaces),
            ' ', -1)
        )
    )AS word,
    COUNT(*) AS nentry
FROM google_file_store JOIN cte_split 
    ON whitespaces <= LENGTH(contents)-LENGTH(REPLACE(contents, ' ', ''))+1
WHERE filename LIKE 'draft%'
GROUP BY word;
