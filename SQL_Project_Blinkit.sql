select * from ['Blinkit_data'];

select count(*) from ['Blinkit_data'];

update ['Blinkit_data']
set [Item Fat Content] =
case
when [Item Fat Content] in ('LF', 'low fat') then 'Low Fat'
when [Item Fat Content] = 'reg' then 'Regular'
else [Item Fat Content]
end;

select distinct([Item Fat Content]) from ['Blinkit_data'];


select sum(sales) as Total_Sales
from ['Blinkit_data'];

select cast(sum(sales)/ 1000000 as decimal(10,2)) as Total_Sales
from ['Blinkit_data'];


select AVG(sales) as Avg_Sales
from ['Blinkit_data'];

select cast(AVG(sales) as decimal(10,2)) as Avg_Sales
from ['Blinkit_data'];

select cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['Blinkit_data'];


select [Item Fat Content], sum(sales) as total_sales
from ['BlinkIT_Data']
group by [Item Fat Content];

select [Item Fat Content], cast(sum(sales) as decimal(10,2)) as total_sales
from ['BlinkIT_Data']
group by [Item Fat Content];

select [Item Fat Content], 
		cast(sum(sales) as decimal(10,2)) as total_sales,
		cast(AVG(sales) as decimal(10,2)) as Avg_Sales,
		count(*) as no_of_items,
		cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['BlinkIT_Data']
where [Outlet Establishment Year]= 2022
group by [Item Fat Content];


select[Item Type], 
		cast(sum(sales) as decimal(10,2)) as total_sales,
		cast(AVG(sales) as decimal(10,2)) as Avg_Sales,
		count(*) as no_of_items,
		cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['BlinkIT_Data']
group by [Item Type]
order by total_sales desc;



select [Outlet Location Type], [Item Fat Content],  
		cast(sum(sales) as decimal(10,2)) as total_sales,
		cast(AVG(sales) as decimal(10,2)) as Avg_Sales,
		count(*) as no_of_items,
		cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['BlinkIT_Data']
group by [Outlet Location Type], [Item Fat Content]
order by total_sales desc;


select [Outlet Establishment Year],  
		cast(sum(sales) as decimal(10,2)) as total_sales
from ['BlinkIT_Data']
group by [Outlet Establishment Year]
order by [Outlet Establishment Year] asc;



select [Outlet Size],
		cast(sum(sales) as decimal(10,2)) as total_sale,
		cast((sum(sales) * 100 / sum(sum(sales)) over()) as decimal(10,2)) as sales_percentage
from ['BlinkIT_Data']
group by [Outlet Size]
order by total_sale desc;




select [Outlet Location Type], 
		cast(sum(sales) as decimal(10,2)) as total_sales,
		cast((sum(sales) * 100 / sum(sum(sales)) over()) as decimal(10,2)) as sales_percentage,
		cast(AVG(sales) as decimal(10,2)) as Avg_Sales,
		count(*) as no_of_items,
		cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['BlinkIT_Data']
group by [Outlet Location Type]
order by total_sales desc;


select [Outlet Type], 
		cast(sum(sales) as decimal(10,2)) as total_sales,
		cast(AVG(sales) as decimal(10,2)) as Avg_Sales,
		count(*) as no_of_items,
		cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from ['BlinkIT_Data']
group by [Outlet Type]
order by total_sales desc;