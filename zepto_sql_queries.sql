create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingprice NUMERIC(8,2),
weightInGmns INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);


--Data Exploration

select count(*) from zepto

select * from zepto
limit 10

--checking if there's any null
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGmns is null
or
outOfStock is null
or
quantity is null;


--exploring different product categories
select distinct(category)
from zepto
order by category

--how many products are in stock and out of stock
SELECT 
    COUNT(CASE WHEN outofstock = true THEN 1 ELSE NULL END) AS countOfOutOfStock,
    COUNT(CASE WHEN outofstock = false THEN 1 ELSE NULL END) AS countInStock
FROM zepto;

/*    or u can write like

select outOfStock,count(sku_id)
from zepto
group by outOfStock  

*/


--Checking product names that are present more than 1's in sku's
select name,count(sku_id) as "No. Of SKU's"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;


--Data Cleaning

--checking for products where price might be zero
select *,mrp,discountedSellingPrice
from zepto
where mrp = 0 or discountedSellingPrice = 0;

--only 1 row that's why deleting
delete from zepto
where mrp = 0;

--converting paise into rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto



--Business Insights
--Q1. Find the top 10 best value products basd on discount percentage
select distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10

--Q2. What are the products with high mrp but outofstock
select distinct name,mrp
from zepto
where outOfStock = true and mrp>300
order by mrp desc;

--Q3.Calculate estimated revenue for each category
select category,
sum(discountedSellingprice * availableQuantity) as estimatedRevenue
from zepto
group by category
order by estimatedRevenue;

--Q4. find all products where mrp is greater than 500 and discount is less than 10%
select name,mrp,discountPercent from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc
--(Insight - these items are popular enough and already sell well without discounts )


--Q5. Identify the top 5 categories offering the highest average discount percenatge
select category,round(avg(discountPercent),2) as AvgDiscount
from zepto
group by category
order by AvgDiscount desc
limit 5
--(marketing team can analyze where product cuts are most and can optimize them accordingly)

--Q6.Find the price per gram for products above 100g and sort by best value
select distinct name,
discountedsellingPrice,
weightInGmns,
round(discountedsellingPrice/weightInGmns,2) as pricePerGram
from zepto
where weightInGmns >= 100
order by pricePerGram


--Q7. group the products into categories like low, medium, bulk based on their weightInGrams
select distinct name,weightInGmns,
case when weightInGmns < 1000 then 'Low'
	when weightInGmns < 5000 then 'Medium'
	else 'Bulk'
	end as weight_category
from zepto	

--Q8. what is the total inventory weight per category
select category,sum(weightInGmns * availableQuantity) as inventory_weight_byCategory
from zepto
group by category
order by inventory_weight_byCategory


