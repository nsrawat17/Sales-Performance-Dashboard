Create Database Sales_db;
use  Sales_db;
Create table Sales_data(
Row_ID  int ,
Order_Id  Text,
Order_Date Text,
Ship_date Text,
Ship_mode Text,
Customer_id  Text,
Customer_name Text,
Segment Text,
Country Text,
City Text,
State Text,
Postel_Code int ,
Region  Text,
Product_id Text,
Category Text,
Sub_Category Text,
Product_name Text,
Sales varchar(100),
Quantity int ,
Discount double,
Profit double 
);

drop table Sales_data;
drop database Sales_db;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sample_Superstore.csv'
INTO TABLE Sales_data
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;



SHOW VARIABLES LIKE 'secure_file_priv';

-- first 10 value of the Dataset 
select *from Sales_data limit 10;

 -- describe the dataset 
describe Sales_data;

-- Count the total rows of Sales_Data
select count(*) from Sales_data;

-- delete null row of  Sales column
delete from Sales_data where Sales is null;

-- Count the null value in particular column 
select count(*) as null_count 
from Sales_data
where Sales is null;

select count(*) as null_count 
from Sales_data
where Order_ID is null;

select count(*) as null_count 
from Sales_data
where Order_Date is null;

select count(*) as null_count 
from Sales_data
where Ship_Date is null;

select count(*) as null_count 
from Sales_data
where City is null;

select count(*) as null_count 
from Sales_data
where State is null;

select count(*) as null_count 
from Sales_data
where Country is null;

select count(*) as null_count 
from Sales_data
where Product_ID is null;

select count(*) as null_count 
from Sales_data
where Product_Name is null;
select count(*) as null_count 
from Sales_data
where Customer_name is null;

select count(*) as null_count 
from Sales_data
where Postel_Code is null;

select count(*) as null_count 
from Sales_data
where Region is null;

select count(*) as null_count 
from Sales_data
where Sales is null;

select count(*) as null_count 
from Sales_data
where Quantity is null;

select count(*) as null_count 
from Sales_data
where Discount is null;

select count(*) as null_count 
from Sales_data
where Profit is null;

select count(*) as empty_customer
from Sales_Data
where Customer_name='';

select count(*) as empty_Sales
from Sales_Data
where Sales='';

select *from Sales_data limit 10;

-- Category wise Totla sales 
select Category, sum(Sales) as Total_sales
from Sales_data
group by Category;

-- top 5 Customers by Sales 
select Customer_Name , Sum(Sales) as Total_Sales_Amount 
from Sales_data
group by Customer_name
order by Total_Sales_Amount desc
limit 5;


-- as per Region 
select Region , Sum(Profit) as Total_Profit_Region
from Sales_data
Group by Region;

-- Most Sold Products 
select Product_Name , Count(*) as Times_Sold
from Sales_data
group by Product_Name 
order by Times_Sold desc
limit 10;

select * from Sales_data limit 1;

--  Count of ship mode Sales by Class wise 
select Ship_mode , Count(*) as Class_wise
from Sales_data
group by Ship_mode
order by Class_Wise desc
limit 10;

-- Avg Sales Category Wise 
select Category, Avg(Quantity) as Avg_Quantity_Sales_Wise
from Sales_data
group by Category;

-- Count Order Quantity Category Wise 
Select Category , Count(Quantity) as Total_Order
from Sales_Data
group by Category;


select Order_id , count(*)
from Sales_data 
group by Order_id
having count(*) >1;


select *from Sales_Data limit 1;

SELECT DISTINCT Order_Date
FROM Sales_Data
LIMIT 10;

SELECT DATE_FORMAT(Str_to_date(Order_Date ,'%d/%m/%y'), '%b %y') AS month,
       SUM(Sales) AS MonthlySales
FROM Sales_Data
GROUP BY month
ORDER BY str_to_date(month , '%b %y');

SELECT 
    YEAR(STR_TO_DATE(Order_Date, '%d/%m/%Y')) AS OrderYear,
    SUM(Sales) AS TotalSales
FROM Sales_Data
GROUP BY OrderYear
ORDER BY OrderYear;

-- Region Wise Sales and Profit 
Select Region , Sum(Sales) as Total_sales,
Sum(Profit) as Total_Profit
from Sales_Data
group by Region;

-- Top 10 Profitable Products 
select Product_name , Sum(Profit) as Total_Profit
from Sales_data
group by Product_name
order by Total_Profit Desc
limit 10;

select Ship_mode,
Count(*) as Total_Order,
Sum(sales) as Total_Sales,
Sum(Profit) as Total_Profit
from Sales_data
group by Ship_mode;

-- Profit Margin Analysis 
Select Category ,
round(Sum(Profit)/Sum(Sales)*100,2)  as Profit_Margin_Percent
from Sales_Data
group by Category;

