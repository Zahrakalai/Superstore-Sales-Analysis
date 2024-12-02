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
Add 2 column:Month,year 
## step4 : Analyze

*1.Total revenue
2261536.7826999$
*2.Total Sales by Year(2015,2016,2017,2018)
2018: 722052.01919999823$
2017 : 600192.550000002$
2015: 479856.20810000092$
2016: 459436.0054000$
*3. Total Sales by month in each year to find out top months base on sales:
2015:                       
| month | total_sales |            
|-------|-------------|
| 9     | 81623.5268  |
| 11    | 77907.6607  |
| 12    | 68167.0585  |
| 3     | 55205.797   |
| 6     | 34322.9356  |
| 7     | 33781.543   |
| 10    | 31453.393   |
| 4     | 27906.855   |
| 8     | 27117.5365  |
| 5     | 23644.303   |
| 1     | 14205.707   |
| 2     | 4519.892    |

2016:
| month | total_sales |
|-------|-------------|
| 11    | 75249.4     |
| 12    | 74543.6     |
| 9     | 63133.61    |
| 8     | 36818.34    |
| 4     | 34154.47    |
| 3     | 32339.32    |
| 10    | 31011.74    |
| 5     | 29959.53    |
| 7     | 28608.26    |
| 6     | 23599.37    |
| 1     | 18066.96    |
| 2     | 11951.41    |

2017:
| month | total_sales        |  
|-------|--------------------|
| 12    | 95739.121000000043 |  
| 11    | 79066.495800000048 |  
| 9     | 69193.390899999926 |  
| 10    | 59583.032999999996 |  
| 5     | 56656.91           |  
| 3     | 51165.06           |  
| 6     | 39724.49           | 
| 4     | 38679.77           | 
| 7     | 38320.782999999996 | 
| 8     | 30542.200299999997 | 
| 2     | 22978.815000000002 |  
| 1     | 18542.490999999995 |  

2018:
| month | total_sales        |   |
|-------|--------------------|---|
| 11    | 117938.15499999998 |   |
| 9     | 86152.89           |   |
| 12    | 83030.388799999942 |   |
| 10    | 77448.131199999931 |   |
| 8     | 62837.847999999976 |   |
| 3     | 58863.412800000013 |   |
| 6     | 48190.727699999974 |   |
| 7     | 44825.10399999997  |   |
| 5     | 43825.98           |   |
| 1     | 43476.473999999987 |   |
| 4     | 35541.910099999986 |   |
| 2     | 19920.997400000011 |   |

I did visualize Total sales by month in each year : https://public.tableau.com/app/profile/zahra.khanlarzadehkolaei/viz/Superstore_salesUnitedStates/Dashboard8#1


![Total sales by month (2015-2018)](C:\Users\zahra\Downloads\sales dataset\Total sales by month (2015-2018).png)
