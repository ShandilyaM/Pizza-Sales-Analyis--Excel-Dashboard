create database pizza_db;
use pizza_db;
select * from pizza_sales limit 80000;
describe pizza_sales;
# Total revenue 
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
# average order value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_val FROM pizza_sales;
# total quantity sold
SELECT SUM(quantity) AS total_quantity_sold FROM pizza_sales;
#total orders placed
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;
# avg pizzas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

# daily trend for total orders
SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_order
FROM
    pizza_sales
GROUP BY DAYNAME(order_date);
# hourly trend for total orders
SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_order
FROM
    pizza_sales
GROUP BY HOUR(order_time);

#percentage of sales by pizza category
SELECT pizza_category, ROUND(SUM(total_price),2) AS total_sales, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2)
AS sales_percentage
FROM pizza_sales
GROUP BY pizza_category;

# top 5 pizzas sold
SELECT 
    pizza_name, SUM(quantity) AS pizzas_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;
# top 5 pizzas sold
SELECT 
    pizza_name, SUM(quantity) AS pizzas_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;
# bottom 5 pizzas sold
SELECT 
    pizza_name, SUM(quantity) AS pizzas_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
LIMIT 5;




