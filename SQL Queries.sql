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

-- daily/monthly trends--

select * from pizza_sales

select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(DW,order_date)

select DATENAME(month, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(month,order_date)
order by Total_orders desc


--% of sale by category/size--

select * from pizza_sales


select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales) as percentage_sale_by_category
from pizza_sales
group by pizza_category

select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=1) as percentage_sale_by_category_in_jan
from pizza_sales
where month(order_date)=1
group by pizza_category


select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as percentage_sale_by_size
from pizza_sales
group by pizza_size
order by percentage_sale_by_size desc

select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2)) as percentage_sale_by_size_in_quarter
from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by percentage_sale_by_size desc




