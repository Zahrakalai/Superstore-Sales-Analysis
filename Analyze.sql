--Total revenue
SELECT 
    SUM(Sales) AS total_revenue
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`;
-- Total revenue: 2261536.7826999

--Daily, Weekly, and Monthly Sales Trends
--yearly sales to to find out which year has the most sales
select 
 year,
 sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Group By year
ORDER BY total_sales DESC ;
-- Max sales in which year:2018
  
-- Monthly Sales
--* Monthly sales in 2015*
select
  month,
  sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
WHERE year=2015
GROUP BY month
order by total_sales DESC ;
--september :81623.5268
--November: 77907.660700000008
--December :68167.058499999

--*Monthly sales in 2016*
select
  month,
  sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
WHERE year=2016
GROUP BY month
order by total_sales DESC ;
-- November: 75249.399499999985	
-- December: 74543.60119999999
-- September : 63133.6060000000

--*Monthly sales in 2017*
select
  month,
  sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
WHERE year=2017
GROUP BY month
order by total_sales DESC ;
-- December: 95739.121000000043
-- November: 79066.495800000048
-- September:69193.3908999999

--*Monthly sales in 2018*
select
  month,
  sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
WHERE year=2018
GROUP BY month
order by total_sales DESC ;
-- November: 117938.15499999998	
-- September: 86152.8880000001
--December: 83030.3887999999

--Daily sales in 2015
select
  Order_Date,
  sum(Sales) AS daily_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Where year=2015
Group By Order_Date
order by daily_sales DESC;
--2015-03-18: 28106.716
--2015-09-08: 14228.427999999998
--2015-11-17: 11544.2740000000

--Daily sales in 2016
select
  Order_Date,
  sum(Sales) AS daily_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Where year=2016
Group By Order_Date
order by daily_sales DESC;

--Daily sales in 2017
select
  Order_Date,
  sum(Sales) AS daily_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Where year=2017
Group By Order_Date
order by daily_sales DESC;
--Daily sales in 2018
select
  Order_Date,
  sum(Sales) AS daily_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Where year=2018
Group By Order_Date
order by daily_sales DESC;

--best days of these 4 years
SELECT
   Order_Date,
   Count(Customer_ID) AS count_of_Sales,
   SUM(Sales) AS Total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Group BY Order_date
ORDER BY Total_sales DESC ;


--Top 10 Cities Base on Total_sales
select
  City AS city,
  Region AS region,
  State AS state,
  sum(Sales) AS total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Group BY City,region,State
ORDER BY total_sales DESC LIMIT 10;

--Total sales by Customer(segment,order_date,city,product_name,sub_category)
select 
  Customer_Name AS customer_name,
  Segment AS segment,
  Order_Date AS order_date,
  City AS city,
  Product_Name AS product_name,
  Category AS category,
  Sub_Category AS sub_category,
  sum(Sales) AS Total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
GROUP BY City,Order_Date,Customer_Name,Segment,Product_Name,Category,Sub_Category
ORDER BY Total_sales DESC  ;

--Contribution of Total sales by each product in 2018
SELECT 
    product_name,
    Category,
    SUM(Sales) AS product_sales,
    CONCAT(ROUND((SUM(sales) / (SELECT SUM(sales)  FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales` where year=2018)) * 100, 2), '%') AS contribution_to_sales 
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Where year=2018
GROUP BY product_name,Category
ORDER BY contribution_to_sales DESC;

--top contributors to total sales based on the Pareto Principle (80/20 Rule)

--Step1:Ranked Sales Calculation
WITH ranked_sales AS (
    SELECT
        product_name,
        SUM(Sales) AS total_sales,   #Aggregation:For each product_name, it calculates the total sales (SUM(Sales) AS total_sales).
       ROUND(SUM(Sales) * 1.0 / (SELECT SUM(Sales) FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`) * 100,2) AS contribution_percentage  --Calculates the percentage contribution of each product's sales to the overall sales
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    GROUP BY product_name
    ORDER BY total_sales DESC   --Orders products by total_sales in descending order, which is essential for calculating cumulative contribution later.
),
--Step 2: Cumulative Contribution   #Purpose:This cumulative percentage helps identify the products that contribute to the first 80% of total sales.
cumulative_sales AS (
    SELECT
        product_name,
        total_sales,
        contribution_percentage,
        SUM(contribution_percentage) OVER (ORDER BY total_sales DESC) AS cumulative_contribution  -- Adds a column cumulative_contribution ,Uses a window function with OVER (ORDER BY total_sales DESC)
    FROM ranked_sales
)
--Step 3: Filter for Top 20% Contributors
SELECT *
FROM cumulative_sales
WHERE cumulative_contribution <= 80; -- To find the top 20% contributors
-- Filter: Retrieves only those rows where the cumulative contribution is less than or equal to 80%. These represent the products that collectively account for 80% of total sales.

--purchase frequency for each customer
SELECT
    Customer_ID AS customer_id,
    Customer_Name AS customer_name,
    sum(Sales) AS total_sales,
    count(*)/ COUNT(DISTINCT Customer_ID) AS purchase_frequency -- Calculates the purchase frequency for each customer.
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
GROUP BY Customer_ID, Customer_Name
ORDER BY total_sales DESC;


SELECT
    COUNT(*) AS total_orders, -- Total number of all orders
    COUNT(DISTINCT Customer_ID) AS total_customers, -- Number of unique customers
    COUNT(*) * 1.0 / COUNT(DISTINCT Customer_ID) AS overall_purchase_frequency
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`;

WITH 
-- Identify customers active in the previous period (6 months ago)
previous_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2018-12-31'), INTERVAL -12 MONTH) -- Start of the previous 6-month period
                           AND DATE_ADD(DATE('2018-12-31'), INTERVAL -6 MONTH)    -- End of the previous 6-month period
),

-- Identify customers active in the current period (last 6 months)
current_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2018-12-31'), INTERVAL -6 MONTH) -- Start of the current 6-month period
                           AND DATE('2018-12-31')                                -- End of the current period
),

-- Identify churned customers (present in the previous period but not in the current period)
churned_customers AS (
    SELECT 
        Customer_ID
    FROM previous_period_customers
    WHERE Customer_ID NOT IN (SELECT Customer_ID FROM current_period_customers)
)

-- Calculate churn rate
SELECT
    COUNT(DISTINCT Customer_ID) AS customers_at_start,  -- Total customers in the previous period
    (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) AS customers_lost, -- Total churned customers
    ROUND(
        (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) * 100.0 / COUNT(DISTINCT Customer_ID), 
        2
    ) AS churn_rate -- Churn rate as a percentage
FROM previous_period_customers;

-- churned customers and churned rate in 2017
WITH 
-- Identify customers active in the previous period (6 months ago)
previous_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2017-12-31'), INTERVAL -12 MONTH) -- Start of the previous 6-month period
                           AND DATE_ADD(DATE('2017-12-31'), INTERVAL -6 MONTH)    -- End of the previous 6-month period
),

-- Identify customers active in the current period (last 6 months)
current_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2017-12-31'), INTERVAL -6 MONTH) -- Start of the current 6-month period
                           AND DATE('2017-12-31')                                -- End of the current period
),

-- Identify churned customers (present in the previous period but not in the current period)
churned_customers AS (
    SELECT 
        Customer_ID
    FROM previous_period_customers
    WHERE Customer_ID NOT IN (SELECT Customer_ID FROM current_period_customers)
)

-- Calculate churn rate
SELECT
    COUNT(DISTINCT Customer_ID) AS customers_at_start,  -- Total customers in the previous period
    (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) AS customers_lost, -- Total churned customers
    ROUND(
        (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) * 100.0 / COUNT(DISTINCT Customer_ID), 
        2
    ) AS churn_rate -- Churn rate as a percentage
FROM previous_period_customers;

-- churned customers and churned rate in 2016
WITH 
-- Identify customers active in the previous period (6 months ago)
previous_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2016-12-31'), INTERVAL -12 MONTH) -- Start of the previous 6-month period
                           AND DATE_ADD(DATE('2016-12-31'), INTERVAL -6 MONTH)    -- End of the previous 6-month period
),

-- Identify customers active in the current period (last 6 months)
current_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2016-12-31'), INTERVAL -6 MONTH) -- Start of the current 6-month period
                           AND DATE('2016-12-31')                                -- End of the current period
),

-- Identify churned customers (present in the previous period but not in the current period)
churned_customers AS (
    SELECT 
        Customer_ID
    FROM previous_period_customers
    WHERE Customer_ID NOT IN (SELECT Customer_ID FROM current_period_customers)
)

-- Calculate churn rate
SELECT
    COUNT(DISTINCT Customer_ID) AS customers_at_start,  -- Total customers in the previous period
    (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) AS customers_lost, -- Total churned customers
    ROUND(
        (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) * 100.0 / COUNT(DISTINCT Customer_ID), 
        2
    ) AS churn_rate -- Churn rate as a percentage
FROM previous_period_customers;

-- churned customers and churned rate in 2015
WITH 
-- Identify customers active in the previous period (6 months ago)
previous_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2015-12-31'), INTERVAL -12 MONTH) -- Start of the previous 6-month period
                           AND DATE_ADD(DATE('2015-12-31'), INTERVAL -6 MONTH)    -- End of the previous 6-month period
),

-- Identify customers active in the current period (last 6 months)
current_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2015-12-31'), INTERVAL -6 MONTH) -- Start of the current 6-month period
                           AND DATE('2015-12-31')                                -- End of the current period
),

-- Identify churned customers (present in the previous period but not in the current period)
churned_customers AS (
    SELECT 
        Customer_ID
    FROM previous_period_customers
    WHERE Customer_ID NOT IN (SELECT Customer_ID FROM current_period_customers)
)

-- Calculate churn rate
SELECT
    COUNT(DISTINCT Customer_ID) AS customers_at_start,  -- Total customers in the previous period
    (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) AS customers_lost, -- Total churned customers
    ROUND(
        (SELECT COUNT(DISTINCT Customer_ID) FROM churned_customers) * 100.0 / COUNT(DISTINCT Customer_ID), 
        2
    ) AS churn_rate -- Churn rate as a percentage
FROM previous_period_customers;


WITH 
-- Identify customers active in the previous period (6-12 months ago)
previous_period_customers AS (
    SELECT DISTINCT Customer_ID, Customer_Name
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2018-12-31'), INTERVAL -12 MONTH) -- Start of the previous 6-month period
                           AND DATE_ADD(DATE('2018-12-31'), INTERVAL -6 MONTH) -- End of the previous 6-month period
),

-- Identify customers active in the current period (last 6 months)
current_period_customers AS (
    SELECT DISTINCT Customer_ID
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    WHERE Order_Date BETWEEN DATE_ADD(DATE('2018-12-31'), INTERVAL -6 MONTH) -- Start of the current 6-month period
                           AND DATE('2018-12-31')                             -- End of the current period
),

-- Find churned customers and their last purchase date
churned_customers AS (
    SELECT 
        ppc.Customer_ID,
        ppc.Customer_Name,
        MAX(cs.Order_Date) AS Last_Purchase_Date -- Get the last purchase date for churned customers
    FROM previous_period_customers ppc
    LEFT JOIN `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales` cs
        ON ppc.Customer_ID = cs.Customer_ID
    WHERE ppc.Customer_ID NOT IN (SELECT Customer_ID FROM current_period_customers)
    GROUP BY ppc.Customer_ID, ppc.Customer_Name
)

-- Final output with duration since last order
SELECT 
    Customer_ID,
    Customer_Name,
    Last_Purchase_Date,
    DATE_DIFF(DATE('2018-12-31'), Last_Purchase_Date, MONTH) AS Months_Since_Last_Order, -- Months since the last order
    DATE_DIFF(DATE('2018-12-31'), Last_Purchase_Date, DAY) AS Days_Since_Last_Order     -- Days since the last order
FROM churned_customers
ORDER BY Months_Since_Last_Order DESC;

--total sales by category
select
Category,
count(distinct Product_ID)
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
GROUP BY Category;
-- Total sales by segment
select
Distinct segment,
sum(Sales)AS Total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
Group By Segment;

--Total sales by customers,find out which customers made the most sales
select
DISTINCT City,Customer_Name,year,
SUM(Sales) AS Total_sales
FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
GROUP BY City,Customer_Name,year
ORDER BY Total_sales DESC;

--Find new Customers in 2018
WITH first_purchase AS (
    SELECT
        Customer_ID,
        MIN(Order_Date) AS first_purchase_date 
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    GROUP BY Customer_ID
)
SELECT 
    fp.Customer_ID AS customer_id,
    cs.Customer_Name AS customer_name,
    fp.first_purchase_date,
    SUM(cs.Sales) AS total_sales_in_2018
FROM first_purchase fp
JOIN `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales` cs
    ON fp.Customer_ID = cs.Customer_ID
WHERE EXTRACT(YEAR FROM fp.first_purchase_date) = 2018
  AND EXTRACT(YEAR FROM cs.Order_Date) = 2018
GROUP BY fp.Customer_ID, cs.Customer_Name, fp.first_purchase_date
ORDER BY total_sales_in_2018 DESC;

--find total number of new customers in each year
WITH first_purchase AS (
    SELECT 
        Customer_ID,
        MIN(Order_Date) AS first_purchase_date
    FROM `astute-curve-435613-t7.Superstore_Sales.Cleaned_Sales`
    GROUP BY Customer_ID
)
SELECT 
    EXTRACT(YEAR FROM first_purchase_date) AS year,
    COUNT(Customer_ID) AS new_customers
FROM first_purchase
GROUP BY year
ORDER BY year;


