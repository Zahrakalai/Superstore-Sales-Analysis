#validate column contents
SELECT  
 count(*) AS total_rows,
 count(distinct Order_ID) AS unique_orders,
 count(distinct Customer_Name) AS unique_customers

FROM `astute-curve-435613-t7.Superstore_Sales.Sales` ;

#Check for Null Values

select
countif(Order_ID is null)  AS count_null_order_ID,
countif(Order_Date is null)  AS count_null_order_date,
countif(Ship_Date is null)  AS count_null_ship_date,
countif(Ship_Mode is null)  AS count_null_ship_mode,
countif(Order_ID is null)  AS count_null_order_ID,
countif(Customer_ID is null)  AS count_null_customer_ID,
countif(Customer_Name is null)  AS count_null_customer_name,
countif(Segment is null) AS null_segment,
COUNTIF(Category IS NULL) AS null_category,
COUNTIF('Sub-Category' IS NULL) AS null_sub_category,
COUNTIF(Product_Name IS NULL) AS null_product_name,
COUNTIF(Sales IS NULL) AS null_sales,
COUNTIF(City IS NULL) AS null_city,
COUNTIF(Region IS NULL) AS null_region,
countIf(Country IS NULL) AS null_country

FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;

SELECT 
    IFNULL(Category, 'Unknown') AS Category,
    IFNULL(Customer_Name,'Unknown') AS customer_name,
    IFNULL(Sales, 0) AS Sales
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;
# change format date to y-m-d
SELECT 
    FORMAT_DATE('%Y-%-m-%-d', Order_Date) AS formatted_order_date,
    FORMAT_DATE('%Y-%-m-%-d', Ship_Date) AS formatted_ship_date
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;

#Identify Inconsistencies
select 
  DISTINCT Category 
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;
select 
  DISTINCT Sub_Category 
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;
select 
  DISTINCT Region 
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;
select 
  DISTINCT Country 
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;
select 
  DISTINCT Segment 
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;

select 
  count(DISTINCT City) AS number_cities
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`;

#Find duplicates

SELECT 
    *,
    COUNT(*) AS duplicate_count
FROM `astute-curve-435613-t7.Superstore_Sales.Sales`
GROUP BY 
    Row_ID ,Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, 
    Customer_Name, Segment, Country, City, State,Postal_Code, Region, 
    Product_ID, Category, Sub_Category, Product_Name, Sales
HAVING duplicate_count > 1;

# Clean Data
CREATE TABLE `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales` AS
(
    SELECT 
        Row_ID,
        Order_ID,
        Order_Date,
        Ship_Date,
        Ship_Mode,
        Customer_ID,
        Customer_Name,
        Segment,
        Country,
        City,
        State,
        IFNULL(CAST(Postal_Code AS STRING), 'Unknown') AS Postal_Code,
        Region,
        Product_ID,
        Category,
        Sub_Category,
        Product_Name,
        Sales,
        -- Add new columns for year and month
        EXTRACT(YEAR FROM Order_Date) AS year,
        EXTRACT(MONTH FROM Order_Date) AS month
    FROM `astute-curve-435613-t7.Superstore_Sales.Sales`
);
