/* -- Question
Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and their total amount.

Return the result table in any order.
*/ 

-- -------------------------------------------------------------
-- My Solution
-- -------------------------------------------------------------

SELECT 
	TO_CHAR(trans_date,'YYYY-MM') AS month,
	country AS country,
	COUNT(id) AS trans_count,
	SUM(amount) AS total_amount,
	SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS appv_count,
	SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS appv_total_amount
FROM transactions1
GROUP BY month, country



-- Question link https://leetcode.com/problems/monthly-transactions-i/description/