/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/

-- Question 1 link ::  https://datalemur.com/questions/sql-page-with-no-likes
---- 1 Solution

SELECT A.page_id
FROM pages AS A
LEFT JOIN page_likes AS B
ON A.page_id = B.page_id
WHERE B.page_id ISNULL
ORDER BY A.page_id

---- 2 Solution
  
SELECT A.page_id
FROM pages A
WHERE NOT EXISTS (
    SELECT 1
    FROM page_likes B
    WHERE B.page_id = A.page_id
)
ORDER BY A.page_id;

--------------------------------------------------------------------------------------------------------------------------
/*

Question 2: 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
Expected Output Columns: app_id, ctr

Question 2 Link :: https://datalemur.com/questions/click-through-rate

*/

---- My Solution


SELECT 
  app_id,
  ROUND(
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) * 100.0 /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),
    2
  ) AS ctr
FROM events
WHERE EXTRACT(YEAR FROM TIMESTAMP) = 2022
GROUP BY app_id;
