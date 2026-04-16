/* Question 1:
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/


---- My Solution

SELECT 
    ABS(COALESCE(m_salary, 0) - COALESCE(e_salary, 0)) AS abs_difference
FROM (
    SELECT 
        MAX(CASE WHEN department = 'Marketing' THEN salary END) AS m_salary,
        MAX(CASE WHEN department = 'Engineering' THEN salary END) AS e_salary
    FROM salaries
) AS sub;



-------------------------------------------------------------------------------------------------------------------------------------

/* Question 2:
Write a query to identify the top 2 Power Users who sent the 
highest number of messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent.
Output the results in descending order based on the count of the messages.

Assumption:

No two users have sent the same number of messages in August 2022.
*/

---- My Solution

SELECT
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(YEAR FROM sent_date) = '2022' AND 
      EXTRACT(MONTH FROM sent_date) = '8'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

