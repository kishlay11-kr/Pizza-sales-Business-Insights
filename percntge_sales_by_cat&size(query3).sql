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
