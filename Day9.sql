/*
-- Question Day-09/30 Find Department's Top three 
salaries in each department.	

A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

*/

WITH CTE 
AS(
	SELECT 
		D.name AS department_name,
		E.name AS employee_name,
		E.salary AS salary,
		DENSE_RANK() OVER(PARTITION BY D.id ORDER BY SALARY DESC) AS rn
	FROM department AS D
	JOIN employee AS E
	ON D.id = E.departmentid
	)

SELECT  department_name,
	employee_name,
	salary
FROM CTE
WHERE rn <= 3


-- Question link https://leetcode.com/problems/department-top-three-salaries/description/
