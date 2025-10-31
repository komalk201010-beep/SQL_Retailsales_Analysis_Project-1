-- SQL_Retail_sales_analysis - Project 1

 CREATE DATABASE Retail_sales_analysis_P1;
 USE Retail_sales_analysis_P1;
 
 -- CREATE TABLE 
 
 DROP TABLE IF EXISTS retailsales;
 
 CREATE TABLE retailsales(
 transactions_id INT PRIMARY KEY,
 sale_date DATE,
 sale_time TIME,
 customer_id INT,
 gender	VARCHAR(10),
 age INT,
 category VARCHAR(50),
 quantiy INT,
 price_per_unit	FLOAT,
 cogs FLOAT,
 total_sale FLOAT);
 
 SELECT * FROM retailsales;
 SELECT count( * )
 FROM retailsales;
 
 SELECT * FROM retailsales
 WHERE 
 transactions_id IS NULL
 OR
 sale_date IS NULL
 OR
 sale_time IS NULL
 OR
 customer_id IS NULL
 OR
 gender IS NULL
 OR
 age IS NULL
 OR
 category IS NULL
 OR
 quantiy IS NULL
 OR
 price_per_unit IS NULL
 OR
 cogs IS NULL
 OR
 total_sale IS NULL;

DELETE FROM retailsales
WHERE 
 transactions_id IS NULL
 OR
 sale_date IS NULL
 OR
 sale_time IS NULL
 OR
 customer_id IS NULL
 OR
 gender IS NULL
 OR
 age IS NULL
 OR
 category IS NULL
 OR
 quantiy IS NULL
 OR
 price_per_unit IS NULL
 OR
 cogs IS NULL
 OR
 total_sale IS NULL;
 
-- DATA EXPLORATION
SELECT * FROM retailsales;

-- Number of sales we have?
SELECT 
COUNT(total_sale)
AS Total_Number_of_sales
FROM retailsales;

-- Number of unique customers
SELECT 
COUNT(DISTINCT customer_id)
AS Total_Number_of_customers
FROM retailsales;

-- Data analysis and key business problems

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM retailsales
WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022:
SELECT * FROM retailsales
WHERE category = 'clothing'
AND quantiy >= 10
AND sale_date BETWEEN '01-11-2022' 
AND '30-11-2022';

desc retailsales;

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT
category, 
SUM(total_sale)
AS Total_sales,
COUNT(*)
AS Total_orders 
FROM retailsales
GROUP BY category; 

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT
category,
ROUND(AVG(age), 2)
FROM retailsales
WHERE category = 'Beauty'; 

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * FROM retailsales
WHERE total_sale > 1000;

-- Write a SQL query to find the total transactions (transaction_id) made by each gender in each category.: 
SELECT 
gender, category,
SUM(transactions_id)
AS total_transactions
FROM retailsales
GROUP BY gender, category
ORDER BY SUM(transactions_id) DESC;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT
ROUND(AVG(total_sale),2)
AS average_sales,
MONTH(sale_date)
AS months
FROM retailsales
GROUP BY MONTH(sale_date)
ORDER BY AVG(total_sale) DESC;

-- Write a SQL query to find the top 5 customers based on the highest total sales:
SELECT
customer_id,
SUM(total_sale)
FROM retailsales
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;

SELECT * FROM retailsales;

-- Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT
COUNT(DISTINCT(customer_id))
AS unique_customers,
category
FROM retailsales
GROUP BY category;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT *,
CASE
WHEN EXTRACT(HOUR FROM sale_time) < 12
THEN 'Morning'
WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17
THEN 'Afternoon'
ELSE 'Evening'
END AS 'shift'
FROM retailsales;
SELECT COUNT(*) 
 
 
 
 
 
 
 
 
 
 
 