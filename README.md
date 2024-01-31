# Pizza_Sales_Analysis-SQL-PowerBI
Pizza Sales Dashoard created using SQL and PowerBI

Problem Statement
KPI's Requirement

We need to analyze key indicators for our pizza sales data to gain insights into our business performance.Specifically, we want to calculate the following metrics:
1. Total Revenue: The sum of the total price of all pizza orders
Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;



2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value
FROM pizza_sales;


3. Total Pizzas Sold: The sum of the quantities of all pizzas sold.
Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;


4. Total Orders: The total number of orders placed.
Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;


5. Average Pizzas per Order: The avergae number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.
Average Pizzas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Average_Pizzas_Order
FROM pizza_sales;



Problem Statement
Charts Requirement
We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirements for creating charts:

1. Daily Trend for Total orders:
Create a barchart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis.
-- Daily Trend
SELECT  DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);


2. Hourly Trend for Total Orders:
Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will alllow us to identify peak hours or periods of high order activity.
-- Hourly Trend
SELECT DATEPART(HOUR,order_time) as order_time, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time);

3. Monthly Trend for Total Orders:
Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will alllow us to identify peak hours or periods of high order activity.
-- Hourly Trend
SELECT DATEPART(HOUR,order_time) as order_time, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time);


3. Percentage of sales by Pizza Category:

Create a pie chart that shows the distribution of sales across different pizza categories. This chart will  provide insights into the popularity of various pizza categories and their contribution to overall sales.
SELECT 
pizza_category, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS Percentageof_TotalSales
FROM pizza_sales
GROUP BY pizza_category;



-- -- Percentage of sales by Pizza category monthwise

SELECT 
pizza_category, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL (10,2)) AS Percentageof_TotalSales

FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

4. Percentage of Sales by Pizza Size:
Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will us understand customer preferences for pizza sizes and their impact on sales.
-- Percentage of sales by pizza size

SELECT 
pizza_size, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS Percentageof_TotalSales_pizzasize

FROM pizza_sales
GROUP BY pizza_size;




5. Total Pizzas sold by Pizza Category:
Create a funnel chart that prsents the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.

SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold;



6. Top 5 Best Sellers by Total Pizzas Sold:
Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold. This chart will help us identify the most popular pizza options.

SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC;



7. Bottom 5 worst Sellers by Total Pizzas Sold
Create a Bar chart showcasing the bottom 5 worst-selling pizzas based on the total number of pizzas sold. This chart will enable us to identify underperforming or less popular pizza options.

SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold;

