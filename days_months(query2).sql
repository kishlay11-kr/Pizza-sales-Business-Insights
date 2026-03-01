-- daily/monthly trends--

select * from pizza_sales

select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(DW,order_date)

select DATENAME(month, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(month,order_date)
order by Total_orders desc

