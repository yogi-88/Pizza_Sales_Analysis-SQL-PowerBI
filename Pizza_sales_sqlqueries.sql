--  Total Revenue: The sum of the total price of all pizza orders
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value
FROM pizza_sales;

--Total Pizzas Sold: The sum of the quantities of all pizzas sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;

-- Total Orders: The total number of orders placed.
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- Average Pizzas per Order: The avergae number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Average_Pizzas_Order
FROM pizza_sales;

--Daily Trend for Total orders:
SELECT  DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

--  Hourly Trend for Total Orders:
SELECT DATEPART(HOUR,order_time) as order_time, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time);

-- Monthly Trend for Total Orders:
SELECT DATEPART(HOUR,order_time) as order_time, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time);

--Percentage of sales by Pizza Category:
SELECT 
pizza_category, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS Percentageof_TotalSales
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of sales by Pizza category monthwise
SELECT 
pizza_category, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL (10,2)) AS Percentageof_TotalSales

FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- Percentage of Sales by Pizza Size:
SELECT 
pizza_size, 
CAST(
SUM(total_price) * 100 / 
(SELECT SUM(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS Percentageof_TotalSales_pizzasize

FROM pizza_sales
GROUP BY pizza_size;

-- Total Pizzas sold by Pizza Category:
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold;

-- Top 5 Best Sellers by Total Pizzas Sold:
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC;

-- Bottom 5 worst Sellers by Total Pizzas Sold

SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold;
