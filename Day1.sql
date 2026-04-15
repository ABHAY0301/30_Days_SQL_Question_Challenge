/* 1. You have two tables: Product and Supplier.
- Product Table Columns: Product_id, Product_Name, Supplier_id, Price
- Supplier Table Columns: Supplier_id, Supplier_Name, Country

-- Write an SQL query to find the name of the product with the highest 
-- price in each country and return product_name, price & country.
*/

-- 1 SOLUTION
SELECT *
FROM (
	SELECT P.product_name,
		P.price,
		S.country,
		ROW_NUMBER() OVER(PARTITION BY S.country ORDER BY P.price DESC) AS rn
	FROM product AS P
	INNER JOIN suppliers AS S
	ON P.supplier_id = S.supplier_id
	) tt
WHERE rn = 1

-- 2 SOLUTION

WITH CTE
AS (SELECT 
		s.country,
		p.product_name,
		p.price,
		ROW_NUMBER()	OVER(PARTITION BY s.country ORDER BY p.price DESC) as rn
	FROM product as p
	JOIN suppliers as s
	ON s.supplier_id = p.supplier_id
	)
SELECT 
	product_name, price,
	country
FROM CTE
WHERE rn =1;


----------------------------------------------------------------------------------------------------------

/* 2. You have two tables: Customer and Transaction.
- Customer Table Columns: Customer_id, Customer_Name, Registration_Date
- Transaction Table Columns: Transaction_id, Customer_id, Transaction_Date, Amount

-- Write an SQL query to calculate the total transaction amount for each customer for the current year. 
The output should contain Customer_Name and the total amount.
*/

SELECT 
	C.customer_name,
	SUM(T.amount) AS total_amount
FROM customers AS C
INNER JOIN transaction AS T
ON C.customer_id = T.customer_id
WHERE EXTRACT(YEAR FROM T.transaction_date ) = '2024'
GROUP BY 1



