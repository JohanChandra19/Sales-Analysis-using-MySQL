create database company;
use company;
select * from Sales;
select * from Sales where Ship_mode='Economy' and Total_Amount>25000;
-- Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01. --
SELECT 
    *
FROM
    Sales
WHERE
    country = 'Ireland'
        AND Category = 'Technology'
        AND Order_Date > '2020-01-01';
        

select * from Sales order by Unit_Profit desc limit 10;

-- Q4: find all the customers whose name starts with j and eneds with n.
select Customer_Name,Order_ID from Sales where Customer_Name like 'J%n';

-- Q5: retrieve all product names that contain 'acc' anywhere in the name.
select Product_Name,Order_ID from Sales where Product_Name like 'J%n';

-- Q6: Get the top 5 cities with the highest total sales amount. --
SELECT 
    SUM(Total_Amount) AS Total_Sales, City
FROM
    Sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q7: Display the second set of ten records for customer name and total amount in decreasing order --
select Customer_name, Total_amount from Sales order by Total_amount desc limit 10,10;

-- Q8: Find the total revenue, average unit cost and total number of orders. --
SELECT 
    AVG(unit_cost) AS `avg unit cost`,
    COUNT(Order_ID) AS `no of orders`,
    SUM(Total_amount) AS `Total revenue`
FROM
    sales;
    
-- Q9: Count the unique no.of regions --
select count(distinct Region) as `no of regions` from Sales;

-- Q10: find the number of orders placed by each customer --
select distinct Customer_name, count(Order_ID) as `Order_count`
from sales
group by Customer_name
order by Order_count desc;

-- Q11: rank 5 products based on total sales using rank() --
-- 4types of ranking funtion 1)row 2)rank 3)dense rank 4)entile --
select Product_name, sum(Total_Amount) as Total_Sales,
rank() over (order by sum(Total_Amount) desc) as Sales_Rank
from Sales
group by Product_Name
limit 5;