create database pizza;
use pizza;

select * from pizza123;

-- Required KPIs:

-- Total sales
select sum(total_price) as  "Total Revenue"
from pizza123;

-- Average Order
select round(sum(total_price)/ count(distinct order_id),2) as "Average Order"
from pizza123;

-- Total Pizzas sold
select sum(quantity) as "Total Pizza"
from pizza123;

-- Total Orders
select count(distinct order_id) as "Total Orders"
from pizza123;

-- Important Queries

-- WEEKLY SALES OF PIZZAS 
select day_name,count(distinct order_id) as "total_order" from pizza123
group by day_name;

-- MONTHLY WISE TOTAL ORDERS
select month_name,count(distinct order_id) as "Total_Order"
from pizza123
group by month_name
order by total_order desc;

-- PIZZA_CATEGORY WISE TOTAL SALES
select pizza_category,round(sum(total_price)) as `Total Sales`
from pizza123
group by pizza_category;

-- TOTAL SALES AND PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size, round(sum(total_price)) as total_sales, 
round(sum(total_price)*100/(select sum(total_price) from pizza123 where quarter=1),2) as "pct"
from pizza123
where quarter=1
group by pizza_size;


-- TOP 6 PIZZA NAMES BY TOTAL ORDERS
select pizza_name, count(distinct order_id)as total_orders
from pizza123
group by pizza_name
order by total_orders desc
limit 5;

-- BOTTOM 6 PIZZA NAMES BY TOTAL ORDERS
select pizza_name, count(distinct order_id)as total_orders
from pizza123
group by pizza_name
order by total_orders ASC
limit 5;

select * from pizza123;

-- TOP 5 PIZZA NAMES BASED ON QUANTITY SOLD
select pizza_name, sum(quantity) as `Quantity Sold`
from pizza123
group by pizza_name
order by `Quantity Sold` desc
limit 5;

-- BOTTOM 5 PIZZA NAMES BASED ON QUANTITY SOLD
select pizza_name, sum(quantity) as `Quantity Sold`
from pizza123
group by pizza_name
order by `Quantity Sold` asc
limit 5;
