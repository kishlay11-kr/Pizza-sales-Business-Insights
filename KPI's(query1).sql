
-- KPI's--
select sum(total_price) as total_revenue from pizza_sales

select sum(total_price)/count(distinct order_id) as average_order_value
from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select count(distinct order_id) as total_orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as average_pizza_per_order
from pizza_sales

select * from pizza_sales