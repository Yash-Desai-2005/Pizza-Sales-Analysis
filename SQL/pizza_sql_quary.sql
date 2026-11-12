use Pizza_DB;
Select * from pizza_sales;

Select Sum(total_price) As Total_Revenue From pizza_sales;
Select Sum(total_price ) / Count(Distinct order_id) As Avg_Order_Value from pizza_sales;
Select Sum(quantity) As Total_Pizza_Sold from pizza_sales;
Select Count(Distinct order_id) As Total_Orders from pizza_sales;
Select Sum(quantity)/ Count(Distinct order_id) As Avg_Pizza_Per_Order From pizza_sales;
Select Dayname(order_date) As order_day, Count(Distinct order_id) As Total_Orders From pizza_sales
Group By Dayname( order_date);

Select Monthname(order_date) As Month_name, Count(Distinct order_id) As Total_Orders From Pizza_sales
Group By Monthname(order_date);

Select pizza_category ,Cast(Sum(total_price) As decimal(10,2)) As total_revenue, 
Cast(Sum(total_price)*100/(Select Sum(total_price) from pizza_sales)As decimal(10,2)) As PCT_of_total_Sales
 from pizza_sales
group by pizza_category;

select pizza_size , Cast(sum(total_price)AS DECIMAL(10,2))As total_sales,
Cast(Sum(total_price)*100/(Select Sum(total_price) from pizza_sales Where Quarter(order_date)=1)As decimal(10,2)) As PCT_of_pizza_size
from pizza_sales
Where Quarter(order_date)=1
group by pizza_size
Order by pizza_size;

Select pizza_category , Sum(quantity)As Total_Quantity_Sold 
From pizza_sales
Group by pizza_category
Order by Total_Quantity_Sold Desc;

Select pizza_name,Sum(total_price) As Total_Revenue
from pizza_sales
Group by pizza_name
Order by Total_Revenue Desc
Limit 5;

Select pizza_name,Sum(total_price) As Total_Revenue
from pizza_sales
Group by pizza_name
Order by Total_Revenue Asc
Limit 5;

Select pizza_name, Sum(quantity) As Total_Quantity From pizza_sales 
Group by pizza_name
Order by Total_Quantity  Desc
Limit 5;

Select pizza_name, Sum(quantity) As Total_Quantity From pizza_sales 
Group by pizza_name
Order by Total_Quantity Asc
Limit 5;

Select Pizza_name,Count(distinct order_id)As Total_Orders From pizza_sales
Group by pizza_name
Order by Total_Orders Asc
Limit 5;

Select Pizza_name,Count(distinct order_id)As Total_Orders From pizza_sales
Group by pizza_name
Order by Total_Orders Desc
Limit 5;