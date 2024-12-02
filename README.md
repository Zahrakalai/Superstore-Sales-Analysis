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
*1.Category of product:*   *Total Product:1849*
*Office Supplies
*Furniture
*Technology
*2.Sub-Category*
17 items:
Art,Paper,Binders,Chairs,Phones,Envelopes,Furnishings,Tables,Fasteners,Machines,Accessories,Storage and Supplies
*3.region*
*Central	
*East
*West
*South
*4.country* : United States
*5.How many cities we deliver products*: 529 cities
*6.segment of customer*   *Total of Customers:793*
*Consumer
*Corporate
*Home Office
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

I did visualize Total sales by month in each year : 


![Total sales by month (2015-2018)](https://github.com/user-attachments/assets/1c6d6de6-9e9a-40a8-8efd-5d8a68d7f1ea)

*4. Total Sales by day of each day and i upload the table of special day's calender in tableau:
This Table show the special days ,i made other years in different sheet of excel and uploaded into tableau to recognize in these days we had better sales or not.

| Date       | special's day             |
|------------|---------------------------|       
| 1/1/2018   | New Year's Day            |
| 1/15/2018  | martin Luther king Jr.day |
| 2/14/2018  | Valentine's day           |
| 2/19/2018  | President's day           |
| 4/1/2018   | Easter Sunday             |
| 4/2/2018   | Easter Monday             |
| 4/17/2018  | Tax Day                   |
| 5/13/2018  | Mother's day              |
| 5/28/2018  | Memorial day              |
| 6/14/2018  | Flag day                  |
| 6/17/2018  | Father's day              |
| 7/4/2018   | Independence day          |
| 9/3/2018   | Labour Day                |
| 10/8/2018  | Columbus day              |
| 10/31/2018 | Halloween                 |
| 11/6/2018  | Election day              |
| 11/12/2018 | veterans Day's day off    |
| 11/22/2018 | Thanksgiving day          |
| 11/23/2018 | Black Friday              |
| 12/24/2018 | Christmas Eve             |
| 12/25/2018 | Christmas Day             |
| 12/26/2018 | Boxing Day                |
| 12/31/2018 | New Year's Eve            |

![daily sales in 2015,2016,2017,2018](https://github.com/user-attachments/assets/6bdb0767-abb9-4f03-806d-5b4ac71239fe)

Daily sales  Trend in each year:


*5. Total Sales base on Product in 3 different categories of each year as different colour:

![Total sales base on product in 3 different Categories](https://github.com/user-attachments/assets/e0c7661c-c98b-4088-82cd-c0f534de22c1)

*6. Total Product of each segment

| Segment     | total_product |
|-------------|---------------|
| Home Office | 1092          |
| Corporate   | 1432          |
| Consumer    | 1700          |

*7. Total Product of each Category

| Category        | f0_  |
|-----------------|------|
| Furniture       | 375  |
| Office Supplies | 1082 |
| Technology      | 404  |

*8. Products contribution of Total sales (%) in each year:

![image](https://github.com/user-attachments/assets/b6b7a600-64cd-41bb-a007-e9288256b180)

*9.Total sales by segment

| segment     | Total_sales |
|-------------|-------------|
| Home Office | 424982.2    |
| Corporate   | 688494.1    |
| Consumer    | 1148061     |

*10. Total sales base on cities in different categories in 2015-2018:
![Total Sales base on Cities in different region in 2015-2018](https://github.com/user-attachments/assets/9922147a-c891-4819-8054-49f8a8925df1)

*11. Top 10 Customers in different segment by different Categories:
![Top 10 customers in different segment by different Categories](https://github.com/user-attachments/assets/b153cd5a-24b4-4a06-a8fb-0d57318fcf92)

*12. Top 10 Customers in different cities 

| City          | Customer_Name | year | Total_sales |
|---------------|---------------|------|-------------|
| Jacksonville  | Sean Miller   | 2015 | 23661.228   |
| Lafayette     | Tamara Chand  | 2017 | 18336.74    |
| Seattle       | Raymond Buch  | 2018 | 14052.48    |
| New York City | Tom Ashbrook  | 2018 | 13723.498   |
| San Antonio   | Becky Martin  | 2015 | 10539.896   |
| Newark        | Hunter Lopez  | 2018 | 10499.97    |
| Minneapolis   | Sanjit Chand  | 2015 | 9900.19     |
| Detroit       | Adrian Barton | 2017 | 9892.74     |
| Lakewood      | Bill Shonely  | 2017 | 9135.19     |

*13. Category Sales Trends by Month and Year (2015-2018)
![Category Sales Trends by Month and Year (2015-2018)](https://github.com/user-attachments/assets/581079e5-fe16-4ab8-a8c7-1a02167c0c40)

*14. 



