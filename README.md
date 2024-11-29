# Superstore-Sales-Analysis

### Step1: ASK 
## KPIs to include:
•	Total Revenue
•	Daily, Weekly, and Monthly Sales Trends
•	Sales by Product Category
•	Sales by Location (City, Region, or Store)
•	Total Units Sold

## Step2: Prepare data 
I got superstore sales dataset from kaggle (https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
This Dataset include 9800 rows and 18 columns
1. Understand the Dataset
The dataset appears to track sales, including customer, product, and shipping details. Key columns include:
Order Details: Order_ID, Order_Date, Ship_Date, Ship_Mode
Customer Details: Customer_ID, Customer_Name, Segment
Geographical Information: Country, City, State, Region, Postal Code
Product Details: Product_ID, Category, Sub-Category, Product_Name
Sales Metrics: Sales
--I uploaded this dataset in google BiqQuery.

# validate column contents
Total Rows: 9800
This indicates that this dataset contains 9800 rows in total.
Unique Orders: 4922
Unique Customers: 793

# check for Null Values
there is no null values

### Identify Inconsistencies
*1.Category of product:*
*Office Supplies
*Furniture
*Technology
*2.region*
*Central	
*East
*West
*South
*3.segment*
*Consumer
*Corporate
*Home Office
*3.Sub-Category*
17 items:
Art,Paper,Binders,Chairs,Phones,Envelopes,Furnishings,Tables,Fasteners,Machines,Accessories,Storage and Supplies
*4.country* : United States
*How many cities we deliver products*: 529 cities
*-- there is no duplicate in rows*
## Step3: Process(clean data)

