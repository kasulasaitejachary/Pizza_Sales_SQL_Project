# Pizza Sales Analysis SQL Project

## Project Overview

**Project Title**: Pizza Sales Analysis

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1. **Set up a pizza sales database**: Create and populate a Pizza sales database with the provided Pizza sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `Pizza_Sales_SQL_Project`.
- **Table Creation**: A table named `Pizza_sales` is created to store the sales data. The table structure includes columns for Pizza_ID, order_ID, pizza_name, quantity, order_date, order_time, unit_price, total_price, pizza_size, pizza_category, pizza_ingredients and pizza_name.

```sql
CREATE DATABASE Pizza_Sales_SQL_Project;

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
```

### 2. Data Exploration & Cleaning

- **Quantity Count**: Determine the total number of records in the dataset.
- **Pizza name Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique pizza categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT * FROM Pizza_Sales;
SELECT COUNT(DISTINCT pizza_category) FROM Pizza_Sales;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to calculate the total revenue.**:

```sql
SELECT
	SUM(total_price) AS "Total_Revenue"
FROM pizza_sales;
```

2. **Write a SQL query to find the average order value.**:

```sql
SELECT
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS "Avg_Order_Value"
FROM pizza_sales;
```

3. **Write a SQL query to find the total pizzas sold.**:

```sql
SELECT
	SUM(quantity) AS "Total_Pizzas_Sold"
FROM pizza_sales;
```

4. **Write a SQL query to find the total number of orders placed.**:

```sql
SELECT
	COUNT(DISTINCT order_id) AS "Total_Orders"
FROM pizza_sales;
```

5. **Write a SQL query to find the average pizzas per order.**:

```sql
SELECT
	CAST(
		CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST((COUNT(DISTINCT order_id)) AS DECIMAL(10, 2))
		AS DECIMAL(10, 2)
	    ) AS "Avg_Pizzas_per_order"
FROM pizza_sales;
```

6. **Write a SQL query to find the Daily Trend for Total Orders.**:

```sql
SELECT
	TO_CHAR(order_date, 'Day') AS order_day,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day;
```

7. **Write a SQL query to find the Hourly Trend for Total Orders.**:

```sql
SELECT
	EXTRACT(
			HOUR FROM order_time
	       ) AS "Order_hours",
	COUNT(DISTINCT order_id) AS "Total_Orders"
FROM pizza_sales
GROUP BY "Order_hours";
```

8. **Write a SQL query to calculate the percentage of sales by pizza category.**:

```sql
SELECT
	pizza_category,
	CAST(SUM(total_price) AS DECIMAL(10, 2)) AS "Total_revenue",
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)
		AS DECIMAL(10, 2)
		) AS "% of sales"
FROM pizza_sales
GROUP BY pizza_category;
```

9. **Write a SQL query to calculate the percentage of sales by pizza size.**:

```sql
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
```

10. **Write a SQL query to calculate the Total Pizzas Sold by Pizza Category.**:

```sql
SELECT
	pizza_category,
	SUM(quantity) as "Total_Quantity_Sold"
FROM pizza_sales
GROUP BY pizza_category
ORDER BY "Total_Quantity_Sold" DESC;
```

11. **Write a SQL query to calculate the Top 5 Best seller by Total Pizzas Sold.**:

```sql
SELECT
	pizza_name,
	SUM(quantity) AS "Total_Pizza_Sold"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total_Pizza_Sold" DESC
LIMIT 5;
```

12. **Write a SQL query to calculate the Bottom 5 Worst seller by Total Pizzas Sold.**:
    
```sql
SELECT
	pizza_name,
	SUM(quantity) AS "Total_Pizza_Sold"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total_Pizza_Sold" ASC
LIMIT 5;
```

 ## Findings

- **Pizza Sales Demographics**: The dataset includes pizza orders from various date, times and pizza size with sales distributed across different categories such as Classic, Chicken, Veggie and Supreme.
- **High-Value Transactions**: Several transactions had a total price, total orders amount.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Sales Insights**: The analysis identifies the top pizza category and the most popular pizza size.

## Reports

- **pizza Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into pizza sales trends across different months and shifts.
- **Seller Insights**: Reports on top sellers and worst sellers based on category.

## Conclusion

This project covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, pizza trends, and sales performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `database_setup.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `analysis_queries.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Saiteja

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

### Connect With Me!

- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/Kasula-saitejachary/)

Thank you for your support, and I look forward to connecting with you!
```
