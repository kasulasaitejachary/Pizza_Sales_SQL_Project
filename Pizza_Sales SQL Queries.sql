-- SQL Pizza Sales Analysis Project

-- Create Table

CREATE TABLE pizza_sales 
			(
				 pizza_id INT,
				 order_id INT,
				 pizza_name_id VARCHAR(50),
				 quantity INT,
				 order_date DATE,
				 order_time TIME,
				 unit_price FLOAT,
				 total_price FLOAT,
				 pizza_size VARCHAR(50),
				 pizza_category VARCHAR(50),
				 pizza_ingredients VARCHAR(200),
				 pizza_name VARCHAR(50)
			);

SELECT * FROM Pizza_Sales;

-- Data Analysis & Business Problems and Answers.

-- 1. Write a SQL query to calculate the total revenue.

SELECT 
	SUM(total_price) AS "Total_Revenue" 
FROM pizza_sales;

-- 2. Write a SQL query to find the average order value.

SELECT
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS "Avg_Order_Value"
FROM pizza_sales;

-- 3. Write a SQL query to find the total pizzas sold.

SELECT
	SUM(quantity) AS "Total_Pizzas_Sold"
FROM pizza_sales;

-- 4. Write a SQL query to find the total number of orders placed.

SELECT
	COUNT(DISTINCT order_id) AS "Total_Orders"
FROM pizza_sales;

-- 5. Write a SQL query to find the average pizzas per order.

SELECT
	CAST(
		CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST((COUNT(DISTINCT order_id)) AS DECIMAL(10, 2)) 
		AS DECIMAL(10, 2)
	    ) AS "Avg_Pizzas_per_order"
FROM pizza_sales;

-- 6. Write a SQL query to find the Daily Trend for Total Orders.

SELECT
	TO_CHAR(order_date, 'Day') AS order_day,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day;

-- 7. Write a SQL query to find the Hourly Trend for Total Orders.

SELECT
	EXTRACT(
			HOUR FROM order_time
	       ) AS "Order_hours",
	COUNT(DISTINCT order_id) AS "Total_Orders"
FROM pizza_sales
GROUP BY "Order_hours";

-- 8. Write a SQL query to calculate the percentage of sales by pizza category.

SELECT
	pizza_category,
	CAST(SUM(total_price) AS DECIMAL(10, 2)) AS "Total_revenue",
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) 
		AS DECIMAL(10, 2)
		) AS "% of sales"
FROM pizza_sales
GROUP BY pizza_category;

-- 9. Write a SQL query to calculate the percentage of sales by pizza size.

SELECT
	pizza_size,
	CAST(SUM(total_price) AS DECIMAL(10, 2)) AS "Total_revenue",
	CAST(
		SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) 
		AS DECIMAL(10, 2)
		) AS "% of sales"
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- 10. Write a SQL query to calculate the Total Pizzas Sold by Pizza Category.

SELECT 
	pizza_category, 
	SUM(quantity) as "Total_Quantity_Sold"
FROM pizza_sales
GROUP BY pizza_category
ORDER BY "Total_Quantity_Sold" DESC;

-- 11. Write a SQL query to calculate the Top 5 Best seller by Total Pizzas Sold.

SELECT 
	pizza_name, 
	SUM(quantity) AS "Total_Pizza_Sold"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total_Pizza_Sold" DESC
LIMIT 5; 

-- 12. Write a SQL query to calculate the Bottom 5 Worst seller by Total Pizzas Sold.

SELECT 
	pizza_name, 
	SUM(quantity) AS "Total_Pizza_Sold"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total_Pizza_Sold" ASC
LIMIT 5;

-- End of the project
	