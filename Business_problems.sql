

select * from retail_sales



-- EXPLORING THE DATA AND CLEANING THE DATA(NULL VALUES)
select count(*) as total_data_count from retail_sales

--Checking for the Null values
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

--Deleting the Null values

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
	
--All the null values have been deleted

--1.)Write a SQL query to retrieve all columns for sales made on '2022-11-05:

select * from retail_sales

select * from retail_sales where sale_date = '2022-11-05'


--2.) Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
--the quantity sold is more than 4 in the month of Nov-2022:

select * from retail_sales

select * from retail_sales where category = 'Clothing' and quantity >= 4 and
to_char(sale_date,'YYYY-MM')='2022-11'


---3.)Write a SQL query to calculate the total sales (total_sale) for each category.:
select * from retail_sales

select category , sum(price_per_unit) as total_sum,count(*) as total_orders from retail_sales
group by 1

--4.)Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select * from retail_sales

select category,round(avg(age)) as average_age from retail_sales where category = 'Beauty'
group by 1 

--5.)Write a SQL query to find all transactions_id where the total_sale is greater than 1000.:

select * from retail_sales


select transactions_id , sum(total_sale) as total_sale from retail_sales
group by 1


--6.) Write a SQL query to find the total number of transactions (transaction_id) made
--by each gender in each category.:

select * from retail_sales

select gender , category , count(*) as total_transaction from retail_sales
group by 1,2

--7.)Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select * from retail_sales

select year,month,average_sale from (
select extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as average_sale,
Rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank from retail_sales
group by 1,2
) as t1
where rank =1 

--8.)**Write a SQL query to find the top 5 customers based on the highest total sales **:

select * from retail_sales

select customer_id,sum(total_sale) as total_sales
from retail_sales
group by 1 
order by 2,1 desc
limit 5

--9.)Write a SQL query to find the number of unique customers who purchased items from each category.:
select * from retail_sales

select distinct category,gender,count(customer_id) as no_of_customers from retail_sales
group by 1,2


--10.)Write a SQL query to create each shift and number of orders 
--(Example Morning <12, Afternoon Between 12 & 17, Evening >17):






